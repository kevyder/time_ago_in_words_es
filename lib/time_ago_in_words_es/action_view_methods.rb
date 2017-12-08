module ActionViewMethods
  def distance_of_time_in_words_in_spanish(from_time, to_time = 0, include_seconds = false)
    from_time = from_time.to_time if from_time.respond_to?(:to_time)
    to_time = to_time.to_time if to_time.respond_to?(:to_time)
    distance_in_minutes = ((to_time - from_time).abs / 60).round
    distance_in_seconds = (to_time - from_time).abs.round

    case distance_in_minutes
    when 0..1
      return distance_in_minutes.zero? ? 'menos de un segundo' : '1 segundo' unless include_seconds
      case distance_in_seconds
      when 0..4
        then 'menos de 5 segundos'
      when 5..9
        then 'menos de 10 segundos'
      when 10..19
        then 'menos de 20 segundos'
      when 20..59
        then 'menos de un minuto'
      else
        '1 minuto'
      end

    when 2..44
      then "#{distance_in_minutes} minutos"
    when 45..89
      then 'aproximadamente 1 hora'
    when 90..1439
      then "aproximadamente #{(distance_in_minutes.to_f / 60.0).round} horas"
    when 1440..2879
      then '1 dia'
    when 2880..43_199
      then "#{(distance_in_minutes / 1440).round} dias"
    when 43_200..86_399
      then 'aproximadamente 1 mes'
    when 86_400..525_959
      then "#{(distance_in_minutes / 43_200).round} meses"
    when 525_960..1_051_919
      then 'aproximadamente 1 año'
    else
      "mas de #{(distance_in_minutes / 525_960).round} años"
    end
  end

  def time_ago_in_words_es(from_time, options = {})
    distance_of_time_in_words_in_spanish(from_time, Time.now, options)
  end
end
