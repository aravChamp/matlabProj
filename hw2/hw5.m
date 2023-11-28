clc
clear
close all

classdef Kickstarter
    properties
        amtpledged double
        by char
        category char
        currency char
        goal double
        City char
        State char
        numbackers double
        pledgetier struct
        title char
        url char
    end
end

data = readtable('most_backed.csv');

% create cell array of Kickstarter instances
kickstarters = cell(size(data,1),1);
for i = 1:size(data,1)
    % split City and State from Location column
    location = split(data.Location{i},', ');
    city = location{1};
    state = location{2};
    
    % create Kickstarter instance
    k = Kickstarter();
    k.amtpledged = data.AmtPledged(i);
    k.by = data.By{i};
    k.category = data.Category{i};
    k.currency = data.Currency{i};
    k.goal = data.Goal(i);
    k.City = city;
    k.State = state;
    k.numbackers = data.NumBackers(i);
    
    % create pledgetier struct array
    for j = 1:length(data.PledgeTier{i})
        pledgetier(j).pledge = data.PledgeTier{i}(j).pledge;
        pledgetier(j).numbackers = data.PledgeTier{i}(j).numbackerstier(j);
    end
    k.pledgetier = pledgetier;
    
    k.title = data.Title{i};
    k.url = data.URL{i};
    
    % add Kickstarter instance to cell array
    kickstarters{i} = k;
end

function plotTiers(kickstarters)
    % initialize arrays to store number of tiers and backers for each tier
    numTiers = zeros(length(kickstarters),1);
    numBackers = zeros(length(kickstarters),1);
    
    % loop through kickstarters to count number of tiers and backers for each tier
    for i = 1:length(kickstarters)
        numTiers(i) = length(kickstarters{i}.pledgetier);
        numBackers(i) = sum([kickstarters{i}.pledgetier.numbackers]);
    end
    
    % plot bar chart
    bar(numTiers,numBackers);
    xlabel('Number of Tiers');
    ylabel('Number of Backers');
    title('Number of Backers vs Number of Tiers');
end

function obj = convertCurrency(obj, currency)
    % define currency conversion rates
    conversionRates = struct('usd', 1, 'gbp', 0.8, 'eur', 0.95, 'cad', 1.31);
    
    % loop through properties and convert currency if applicable
    props = properties(obj);
    for i = 1:length(props)
        prop = props{i};
        if isa(obj.(prop), 'double') && contains(prop, 'amt') || contains(prop, 'goal')
            obj.(prop) = obj.(prop) * conversionRates.(currency);
        end
        if isa(obj.(prop), 'struct') && contains(prop, 'pledge')
            for j = 1:length(obj.(prop))
                obj.(prop)(j).pledge = obj.(prop)(j).pledge * conversionRates.(currency);
            end
        end
    end
    
    % set new currency char
    obj.currency = currency;
end

