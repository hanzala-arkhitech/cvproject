json.extract! cv, :id, :email, :cvemail, :image, :fullname, :phone, :sociallink, :schoolcollege, :major, :duration, :experience, :skills, :certification, :created_at, :updated_at
json.url cv_url(cv, format: :json)
