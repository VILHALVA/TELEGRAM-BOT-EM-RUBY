require 'telegram/bot'
require_relative 'config'

TOKEN = Config::BOT_TOKEN

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(
        chat_id: message.chat.id,
        text: "Olá, #{message.from.first_name}! Bem-vindo ao bot. Aqui estão os comandos disponíveis:\n\n" \
              "/start - Ver a saudação e os comandos disponíveis\n" \
              "/help - Exibe uma mensagem de ajuda\n" \
              "/about - Informações sobre o bot"
      )
    when '/help'
      bot.api.send_message(
        chat_id: message.chat.id,
        text: "Para usar o bot, você pode utilizar os seguintes comandos:\n" \
              "/start - Exibe uma saudação e lista de comandos\n" \
              "/help - Exibe esta mensagem de ajuda\n" \
              "/about - Informações sobre o bot"
      )
    when '/about'
      bot.api.send_message(
        chat_id: message.chat.id,
        text: "Este é um bot básico criado com Ruby usando a API do Telegram."
      )
    else
      bot.api.send_message(
        chat_id: message.chat.id,
        text: "Comando não reconhecido. Use /help para ver os comandos disponíveis."
      )
    end
  end
end
