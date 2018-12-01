require 'telegram/bot'

token = '750395870:AAEICNTpovqitfw2e6cJCIESh9Bm-XUlQvE'
def enviar_video(link)
  log = `"youtube-dl.exe" --extract-audio --audio-format mp3 #{link}`
  log.lines.find{ |str| str.include?('[ffmpeg]') }[22..-1].strip
end
Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    file = enviar_video(message)
    bot.api.send_audio(chat_id: message.chat.id, audio: Faraday::UploadIO.new(file, 'audio/mp3'))
  end
end
