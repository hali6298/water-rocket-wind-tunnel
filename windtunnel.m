
function CD2 = windtunnel(Windspeed,A)
filename = ['1WTData_Test.txt';'2WTData_Test.txt';'3WTData_Test.txt'];
Size = size(filename);
length = Size(1);

 
CD = zeros(3,6);
V_inf = zeros(3,6);
for i = 1:length
    data = load(filename(i,:));
    Vinf = data(:,4);
    rho_inf = data(:,11);
    q_inf = 0.5*rho_inf.*Vinf.^2;
    Axial = data(:,7);
    Cd = Axial./(q_inf*A);
    CD(i,1) = mean(Cd(1:100));
     V_inf(i,1) = mean(Vinf(1:100));
    CD(i,2) = mean(Cd(101:200));
    V_inf(i,2) = mean(Vinf(101:200));
    CD(i,3) = mean(Cd(201:300));
    V_inf(i,3) = mean(Vinf(201:300));
    CD(i,4) = mean(Cd(301:400));
    V_inf(i,4) = mean(Vinf(301:400));
    CD(i,5)  = mean(Cd(401:500));
    V_inf(i,5) = mean(Vinf(401:500));
    CD(i,6) =  mean(Cd(501:600));
    V_inf(i,6) = mean(Vinf(501:600));
    
    if i==1;
    myfit = polyfit(V_inf(i,:),CD(i,:),5);
    %x = linspace(2,23)
    CD2 = polyval(myfit,Windspeed);
    end
    % end
  % figure
  % hold on
  % scatter(V_inf(i,:),CD(i,:),'o')
  % scatter(x,CD2,'*')
  % hold off
end
  
end