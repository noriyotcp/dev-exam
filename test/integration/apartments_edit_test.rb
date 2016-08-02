require 'test_helper'

class ApartmentsEditTest < ActionDispatch::IntegrationTest
  def setup
    @apartment = apartments(:one)
    @apartment.nearest_stations.delete_all
  end

  test "unsuccessful edit" do
    get edit_apartment_path(@apartment)
    patch apartment_path(@apartment), params: { apartment: { name: '',
                                                             rent: -1,
                                                             address: '',
                                                             building_age: -1 } }
    assert_equal controller.controller_name, 'apartments'
    assert_not_equal controller.action_name, 'show'
  end

  test "successful edit" do
    get edit_apartment_path(@apartment)
    name = '神泉ハイツ'
    rent = 85000
    address = '東京都渋谷区神泉町'
    building_age = 32
    note = 'デイリーヤマザキ 神泉店まで308m/ローソン 神泉駅前店まで349m/巡回管理/リフォーム：2012年7月キッチン・シャワールーム・洗面化粧台・トリフォーム済/Tポイントも貯めれます♪引越業者割引有り☆'
    patch apartment_path(@apartment), params: { apartment: { name: name,
                                                             rent: rent,
                                                             address: address,
                                                             building_age: building_age,
                                                             note: note } }
    assert_not flash.empty?
    assert_redirected_to @apartment
    @apartment.reload

    assert_equal name, @apartment.name
    assert_equal rent, @apartment.rent
    assert_equal address, @apartment.address
    assert_equal building_age, @apartment.building_age
    assert_equal note, @apartment.note
  end

  test "successful edit with nearest stations" do
    get edit_apartment_path(@apartment)
    nearest_station_1_params = { line: 'JR山手線', name: '渋谷駅', minutes_walk: 13 }
    nearest_station_2_params = { line: '京王井の頭線', name: '神泉駅', minutes_walk: 3 }

    nearest_stations_params = { "0"=>nearest_station_1_params, "1"=>nearest_station_2_params }

    patch apartment_path(@apartment), params: { apartment: { name: @apartment.name,
                                                             rent: @apartment.rent,
                                                             address: @apartment.address,
                                                             building_age: @apartment.building_age,
                                                             note: @apartment.note,
                                                             nearest_stations_attributes: nearest_stations_params } }
    assert_not flash.empty?
    assert_redirected_to @apartment
    @apartment.reload

    @nearest_station_1 = @apartment.nearest_stations.first
    @nearest_station_2 = @apartment.nearest_stations.second

    assert_equal nearest_station_1_params[:line], @nearest_station_1.line
    assert_equal nearest_station_1_params[:name], @nearest_station_1.name
    assert_equal nearest_station_1_params[:minutes_walk], @nearest_station_1.minutes_walk

    assert_equal nearest_station_2_params[:line], @nearest_station_2.line
    assert_equal nearest_station_2_params[:name], @nearest_station_2.name
    assert_equal nearest_station_2_params[:minutes_walk], @nearest_station_2.minutes_walk
  end
end
