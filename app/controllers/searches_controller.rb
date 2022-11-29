require 'google/apis/youtube_v3'
require 'active_support/all'

class SearchesController < ApplicationController
  GOOGLE_API_KEY = "AIzaSyBUsCWjX4xx51cN810jaw2G65VFNx7MaHo"

  def index
    @youtube_data = find_videos('APEX ブロンズ')
  end

  def find_videos(keyword, after: 1.months.ago, before: Time.now)
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.key = GOOGLE_API_KEY

    next_page_token = nil
    opt = {
      q: keyword,
      type: 'video',
      max_results: 3,
      order: :date,
      page_token: next_page_token,
      published_after: after.iso8601,
      published_before: before.iso8601
    }
    service.list_searches(:snippet, **opt)
  end
end

