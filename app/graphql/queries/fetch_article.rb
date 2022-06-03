module Queries
    class FetchArticle < Queries::BaseQuery
      type Types::ArticleType, null: false
      argument :id, ID, required: true
  
      def resolve(id:)
        Article.find(id)
      rescue ActiveRecord::RecordNotFound => _e
        GraphQL::ExecutionError.new('Article does not exist.')
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end