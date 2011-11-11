xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Kona Signage Stuff"
    xml.description "Data for Kona digital signage"
    xml.link articles_url

    for article in @articles
      xml.item do
        xml.title article.title
        xml.description article.description
        xml.pubDate article.created_at.to_s(:rfc822)
        xml.link article_url(article)
        xml.guid article_url(article)
        if article.media.present?
          xml.enclosure(:url => "http://#{request.host_with_port}#{article.media.url()}", :length => article.media_file_size, :type => article.media_content_type)
        end
      end
    end
  end
end