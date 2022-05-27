module Api
  module V2
    class ProductsController < BaseController
      def index
        products = Product.where(category: 'Category1')
        render_success(
          data: { producst: products, count: products.length },
          message: I18n.t('products.list')
        )
      end
    end
  end
end