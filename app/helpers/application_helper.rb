module ApplicationHelper
  def phrase_length(blog)
    if blog.phrase.tracks[0]['data'].empty?
      "0 Bars"
    else
      data = JSON.parse(blog.phrase.tracks[0]['data']).last["time"].split(":")[0].to_i + 1
      "#{data} Bars"
    end
  end
  
end
