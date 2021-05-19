class ArticleBlueprint < Blueprinter::Base
    identifier :id


    view :normal do
        fields :title, :body, :created_at


    end
end
