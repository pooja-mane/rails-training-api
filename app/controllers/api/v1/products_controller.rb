module Api
  module V1
    class ProductsController < BaseController

      def index
        products = Product.all

        # render json: products, each_serializer: ProductSerializer

        ## without any method
        render_success(
          data: { products: products },
          message: I18n.t('products.list')
        )

        ## using as_json
        # render_success(
        #   data: { producst: products.map(&:short_response) },
        #   message: I18n.t('products.list')
        # )

        ## using active model serializer
        # render_success(
        #   data: { products: serialize_resource(products, ProductSerializer) },
        #   message: I18n.t('products.list')
        # )
      end
    end
  end
end
