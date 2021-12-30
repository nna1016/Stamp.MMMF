json.extract! site_info, :id, :ip_add, :created_at, :updated_at
json.url site_info_url(site_info, format: :json)
