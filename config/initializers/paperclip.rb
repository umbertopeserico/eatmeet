PaperclipConfig =
    if Rails.env.production?
      OpenStruct.new(
          :storage => :s3,
          :s3_host_name => ENV.fetch('S3_HOST_NAME'),
          :s3_credentials => {
              :bucket => ENV.fetch('S3_BUCKET_NAME'),
              :access_key_id => ENV.fetch('AWS_ACCESS_KEY_ID'),
              :secret_access_key => ENV.fetch('AWS_SECRET_ACCESS_KEY'),
              :s3_region => ENV.fetch('AWS_REGION')
          }
      )
    else
      OpenStruct.new
    end