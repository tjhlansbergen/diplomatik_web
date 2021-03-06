# log_helper.rb - Tako Lansbergen 2020/01/25
# 
# Helper module voor het schrijven van logregels naar de database

module LogHelper

    # schrijft 1 logentry, met de opgegeven severity en message
    def log(origin, severity, message)

        # maak en schrijf nieuwe log entry (datum wordt automatisch ingevoegd door overerven van ActiveRecord door LogEntry)
        entry = LogEntry.new(origin: origin, severity: severity, message: message)
        entry.save

        # om de database niet te overspoelen maken we een 'rolling-log', verwijder de oudste entries als er meer zijn dan n zijn
        if LogEntry.count > Rails.configuration.max_log_entries
            LogEntry.order(created_at: :asc).limit(LogEntry.count - Rails.configuration.max_log_entries).destroy_all
        end
    end
end
