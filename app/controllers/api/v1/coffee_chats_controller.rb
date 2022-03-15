class Api::V1::CoffeeChatsController < Api::V1::GraphitiController
  def index
    coffee_chats = CoffeeChatResource.all(params)
    respond_with(coffee_chats)
  end

  def show
    coffee_chat = CoffeeChatResource.find(params)
    respond_with(coffee_chat)
  end

  def create
    coffee_chat = CoffeeChatResource.build(params)

    if coffee_chat.save
      render jsonapi: coffee_chat, status: :created
    else
      render jsonapi_errors: coffee_chat
    end
  end

  def update
    coffee_chat = CoffeeChatResource.find(params)

    if coffee_chat.update_attributes
      render jsonapi: coffee_chat
    else
      render jsonapi_errors: coffee_chat
    end
  end

  def destroy
    coffee_chat = CoffeeChatResource.find(params)

    if coffee_chat.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: coffee_chat
    end
  end
end
