class ListController < ApplicationController
    def index
        @sort_options = SortOptions
        @categories = Category.all.order(Category.arel_table[:name].asc)
        @filters = ListFilters.from_params(request, params, @categories, 100)
        @people = Person.filter(@filters)

        render turbo_stream: turbo_stream.update(
                "list-data",
                partial: "shared/list/list_content",
                locals: { people: @people }
            ) if turbo_frame_request?
    end
end
