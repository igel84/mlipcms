module Delivery

  class Autotrading
    class << self
      include ApiUtilites
      def cities_list
        url = try_url('http://www.ae5000.ru/api.php?metod=city&type=from')
        json_from_url(url)['result']
      end

      def delivery_price(from, to, weight, volume)
        url = try_url("http://www.ae5000.ru/api.php?metod=calculate&from=#{from}&to=#{to}&weight=#{weight}&volume=#{volume}")
        json_from_url(url)['result']
      end
    end
  end

end
