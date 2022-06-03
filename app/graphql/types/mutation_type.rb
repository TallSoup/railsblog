module Types
  class MutationType < Types::BaseObject
    field :add_article, mutation: Mutations::AddArticle
  end
end