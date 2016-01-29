# Expenses API

## Hosted version

An hosted version is ready at http://expenses-api.herokuapp.com/.
Visit the homepage to wake up the app, as it's a free-dyno. First request is gonna take ~30 seconds. After that, you'll be ready to go !

You can host it locally as well.
For demo datas, run `rake demo:populate`.

## Routes

`Prefix` is just rails' name for its routes, you shouldn't be concerned by this. Neither by `Controller#Action`

````
                  Prefix Verb   URI Pattern                                        Controller#Action
         api_v1_expenses GET    /api/v1/expenses(.:format)                         api/v1/expenses#index
                         POST   /api/v1/expenses(.:format)                         api/v1/expenses#create
      new_api_v1_expense GET    /api/v1/expenses/new(.:format)                     api/v1/expenses#new
     edit_api_v1_expense GET    /api/v1/expenses/:id/edit(.:format)                api/v1/expenses#edit
          api_v1_expense GET    /api/v1/expenses/:id(.:format)                     api/v1/expenses#show
                         PATCH  /api/v1/expenses/:id(.:format)                     api/v1/expenses#update
                         PUT    /api/v1/expenses/:id(.:format)                     api/v1/expenses#update
                         DELETE /api/v1/expenses/:id(.:format)                     api/v1/expenses#destroy
    api_v1_user_expenses GET    /api/v1/users/:user_id/expenses(.:format)          api/v1/expenses#index
            api_v1_users GET    /api/v1/users(.:format)                            api/v1/users#index
                         POST   /api/v1/users(.:format)                            api/v1/users#create
         new_api_v1_user GET    /api/v1/users/new(.:format)                        api/v1/users#new
        edit_api_v1_user GET    /api/v1/users/:id/edit(.:format)                   api/v1/users#edit
             api_v1_user GET    /api/v1/users/:id(.:format)                        api/v1/users#show
                         PATCH  /api/v1/users/:id(.:format)                        api/v1/users#update
                         PUT    /api/v1/users/:id(.:format)                        api/v1/users#update
                         DELETE /api/v1/users/:id(.:format)                        api/v1/users#destroy
api_v1_category_expenses GET    /api/v1/categories/:category_id/expenses(.:format) api/v1/expenses#index
       api_v1_categories GET    /api/v1/categories(.:format)                       api/v1/categories#index
                         POST   /api/v1/categories(.:format)                       api/v1/categories#create
     new_api_v1_category GET    /api/v1/categories/new(.:format)                   api/v1/categories#new
    edit_api_v1_category GET    /api/v1/categories/:id/edit(.:format)              api/v1/categories#edit
         api_v1_category GET    /api/v1/categories/:id(.:format)                   api/v1/categories#show
                         PATCH  /api/v1/categories/:id(.:format)                   api/v1/categories#update
                         PUT    /api/v1/categories/:id(.:format)                   api/v1/categories#update
                         DELETE /api/v1/categories/:id(.:format)                   api/v1/categories#destroy
````

## Expense#create|#update

It's an example, `user_id` & `category_id` are fictional.
````json
{
  "expense": {
    "user_id": 6,
    "amount": 12.5,
    "note": "Never gonna give you up",
    "category_id": 6  
  }
}
````

## User#create|#update

````json
{
  "user": {
    "username": "Rick"
  }
}
````

## Category#create|#update

````json
{
  "category": {
    "name": "Let down"
  }
}
````
