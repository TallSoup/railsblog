module Mutations
    class AddArticle < Mutations::BaseMutation
      argument :params, Types::Input::ArticleInputType, required: true
  
      field :article, Types::ArticleType, null: false
  
      def resolve(params:)
        article_params = Hash params
  
        begin
          article = Article.create!(article_params)
  
          { article: article }
        rescue ActiveRecord::RecordInvalid => e
          GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
            " #{e.record.errors.full_messages.join(', ')}")
        end
      end
    end
  end