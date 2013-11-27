module ApiUtilites
  class ConnectionError < StandardError; end

  def try_url(url)
    tries = 0
    begin
      tries += 1
      url = open(url)
    rescue
      if tries < 4
        sleep(2)
        retry
      else
        raise ConnectionError, "Can't access to #{url}"
      end
    else
      url
    end
  end

  def json_from_url(url)
    JSON.parse(url.collect{ |l| l.encode('UTF-8') }[0])
  end

end
