require 'test_helper'

class ApartmentsDestroyTest < ActionDispatch::IntegrationTest
  def setup
    @apartment = apartments(:one)
  end

  test "successful destroy" do
    get apartments_path

    assert_difference('Apartment.count', -1) do
      delete apartment_path(@apartment)
    end
    assert_redirected_to apartments_path
  end
end
