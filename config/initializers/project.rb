ENV['PROJECT_NAME'] ||= JSON.parse(Rails.root.join('package.json').read)["name"]
