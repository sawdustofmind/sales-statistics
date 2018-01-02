require 'test_helper'

class SaleTest < ActiveSupport::TestCase
  self.use_instantiated_fixtures = true

  test "should raise an exception" do
    assert_raises(ArgumentError) { Sale.calculate_statistics! '2017-02-02', '2017-02-01' }
    assert_raises(ArgumentError) { Sale.calculate_statistics! '2017-0202', '2017-0-01' }
  end

  test "should calculate rightly" do
    result = Sale.calculate_statistics! '2017-03-01', '2017-03-02'
    assert_equal result[:goods].detect { |elem| elem[:title] == 'Artificial Flowers' }[:revenue],  BigDecimal('128119.42')
    assert_equal result[:goods].detect { |elem| elem[:title] == 'Baked Goods' }[:revenue],  BigDecimal('70420.45')
    assert_equal(result[:total_revenue], BigDecimal('198539.87'))
  end
end
