%%
clear all; close all; clc;

xvals = randn(20,2) * sqrt(0.3) + 2
yvals = randn(20,2) * sqrt(0.3) + 7

figure(1)
axis([0 9 0 9])
axis('square')
axis equal
colormap('gray')
plot(xvals(:,1),xvals(:,2),'ro')
hold on
plot(yvals(:,1),yvals(:,2),'go')
plot(4.5,4.5,'o')
xlabel('X')
ylabel('Y')
title('Nearest Neighbor')

listpoints = [xvals;yvals]
getassoc = [zeros(20,1);ones(20,1)]

numneighbors = 1
dist = zeros(40, 1)
listpointsordered = zeros(40,2)

for i=1:40
    dist(i) = sqrt( (4.5- listpoints(i,1))^2 + (4.5-listpoints(i,2))^2)
end

%%
for i = 1:numneighbors
    min = 999999
    ind = 1
    for j = 1:length(listpoints)
        if dist(j) < min
            ind = j
            min = dist(j)
        end
    end
    tempar = [4.5,4.5;listpoints(ind,1),listpoints(ind,2)]
    if eq(getassoc(ind),1)
         plot(tempar(:,1), tempar(:,2),'g')
    else
         plot(tempar(:,1), tempar(:,2), 'r')
    end
    getassoc(ind) = []
    colorchoice = sum(getassoc)
    if colorchoice > length(getassoc)/2
        plot(4.5,4.5, 'ro')
    else
        plot(4.5,4.5, 'go')
    end
    dist(ind) = []
    listpoints(ind,:)=[]
end