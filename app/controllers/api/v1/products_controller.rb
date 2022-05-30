module Api
  module V1
    class ProductsController < BaseController

      def index
        products = Product.all
        render_success(
          data: { products: products },
          message: I18n.t('products.list')
        )
      end
    end
  end
end
