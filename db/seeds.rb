# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@apartment_1_params = { name: '神泉ハイツ', rent: 85000, address: '東京都渋谷区神泉町', building_age: 32, note: 'デイリーヤマザキ 神泉店まで308m/ローソン 神泉駅前店まで349m/巡回管理/リフォーム：2012年7月キッチン・シャワールーム・洗面化粧台・トリフォーム済/Tポイントも貯めれます♪引越業者割引有り☆' }
@apartment_2_params = { name: 'セゾン代官山', rent: 77000, address: '東京都渋谷区恵比寿西2', building_age: 31, note: '初期費用他 合計1.62万円 （内訳：鍵交換費用1.62万）' }

@nearest_station_1_params = { line: 'JR山手線', name: '渋谷駅', minutes_walk: 13 }
@nearest_station_2_params = { line: '京王井の頭線', name: '神泉駅', minutes_walk: 3 }

@nearest_stations_params = { nearest_stations_attributes: {"0"=>@nearest_station_1_params, "1"=>@nearest_station_2_params} }
@nearest_stations_empty_params = { nearest_stations_attributes: {"0"=>{}, "1"=>{}} }

@apartment_1 = Apartment.new(@apartment_1_params.merge(@nearest_stations_params))
@apartment_2 = Apartment.new(@apartment_2_params.merge(@nearest_stations_empty_params))

@apartment_1.save!
@apartment_2.save!
