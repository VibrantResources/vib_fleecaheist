function CheckPlayerJobAndType(playerJob)
    if playerJob.type == Config.PoliceInformation.PoliceJob.JobType then

        return true
    end

    for k, v in pairs(Config.PoliceInformation.PoliceJob.JobNames) do
        if v == playerJob.name then

            return true
        end
    end

    return false
end