class SalesController < ApplicationController

  def new

  end

  def create
    @new_sale = Sale.new(sale_params)
    if @new_sale.discount.to_i  > 0 then @new_sale.total = @new_sale.value - (@new_sale.value * (@new_sale.discount.to_f / 100)) end
    puts @new_sale.tax
    if @new_sale.tax == 1
      @new_sale.tax = 19.0
      @new_sale.total = @new_sale.total * (@new_sale.tax.to_f/100 + 1)
    else
      @new_sale.tax = 0
    end
    last = Sale.last
    @new_sale.cod = last.cod.to_i + 1
    @new_sale.value =  @new_sale.value.to_i
    @new_sale.discount =  @new_sale.discount.to_i

    @new_sale.save
    redirect_to sales_done_path
  end

  def done
    @sale = Sale.last
  end

  private

  def sale_params
    params.require(:sale).permit(:detail, :category, :value, :discount, :tax, :cod, :total)
  end
end
