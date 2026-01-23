#> hvr:api/get_data/recipe_book
#
# Get data
#
# @output
#   storage
#       hvr:api recipeBook
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api recipeBook

# Migrate data
    data modify storage hvr:api recipeBook set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.recipeBook
