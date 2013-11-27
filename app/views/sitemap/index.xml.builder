xml.instruct! :xml, :version=>"1.0", encoding: "UTF-8"
xml.tag! 'urlset', "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  #README https://www.google.com/webmasters/tools/docs/ru/protocol.html
  for p in @pages do
    xml.tag! 'url' do
      xml.tag! 'loc', p.home == true ?  'http://krokos.org' : 'http://krokos.org/'+p.slug
      xml.tag! 'lastmod', p.updated_at.strftime("%Y-%m-%dT%H:%M:%S+00:00")
      xml.tag! 'changefreq', 'daily'
      xml.tag! 'priority', '0.9'
    end
  end
  xml.tag! 'url' do
    xml.tag! 'loc', 'http://krokos.org/dostavka-v-russia'
    xml.tag! 'lastmod', "2013-11-10T23:11:23+00:00"
    xml.tag! 'changefreq', 'monthly'
    xml.tag! 'priority', '0.8'
  end
  for c in City.all do
    xml.tag! 'url' do
      xml.tag! 'loc', 'http://'+c.domain+'.krokos.org/dostavka-v-russia'
      xml.tag! 'lastmod', "2013-11-10T23:11:23+00:00"
      xml.tag! 'changefreq', 'daily'
      xml.tag! 'priority', '0.7'
    end
  end
end