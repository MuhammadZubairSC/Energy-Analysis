%Program = Energy_Consevation_Analysis.m
%Program provides analytical explanation of interconversion of kinetic and potential energy
%using Law of Conservation of Energy.
%Created on August 22, 2015 by M. Zubair Salahuddin C
%
%
%Input Variables:
%
%x = Horizontal distance of hilly terrain with large intervals (in kilometres)
%y = Elevations of hilly terrain (in metres)
%xactual = Horizontal distance of hilly terrain with small intervals 
%          (in kilometres)
%yactual = Interpolated Heights of hilly terrain (in metres)
%xgrap = Horizontal distance of hilly terrain with intervals equal changing
%intervals      (in kilometres
%k = Iteration counter
%h0 = Initial height of the hilly terrain (in metres)
%h1 = Second height of the hilly terrain (in metres)
%h2 = Third height of the hilly terrain (in metres)
%h3 = Fourth height of the hilly terrain (in metres)
%h4 = Fifth height of the hilly terrain (in metres)
%h5 = Sixth height of the hilly terrain (in metres)
%h6 = Seventh height of the hilly terrain (in metres)
%h7 = Eighth height of the hilly terrain (in metres)
%h8 = Ninth height of the hilly terrain (in metres)
%h9 = Tenth height of the hilly terrain (in metres)
%h10 = Final height of the hilly terrain (in metres)
%v0 = Initial speed of vehicle (in metres per second)
%v_0 = Initial speed of vehicle (in kilometres per second)
%v1  = First additional speed of the vehicle (in metres per second)
%v_1 = First additional speed of the vehicle (in kilometres per second)
%v2  = Second additional speed of the vehicle (in metres per second)
%v_2   = Second additional speed of the vehicle (in kilometres per second)
%vmax = Maximum speed of the vehicle selected from garage 
%      (in metres per second)
%track = Contains the value of the hilly terrain choose by the user
%vehicle_one = Contains the value of vehicle selected by the user
%Brake = A switch to decrease the speed by one metres per second
%Accelerator = A switch to increase the speed by one metre per second
%g = Acceleration due to gravity (9.81 metres per second square)
%m = Mass of vehicle (Commonly known as vehicle's curb weight) in kilogram
%radiopanel = Variable that contains the selected value from plot analysis pa
%panel
%choice = Contains the string value of variable 'radiopanel'
%plottype= A variable that triggers the real time plotting of kinetic and potential
%(in Joules) with respect to distance (in metres) 
%
%Output Variables:
%
%K_E = Kinetic energy of the vehicle in Joules
%P_E = Potential energy of the vehicle in Joules
%PE = Potential energy of the vehicle till it stops in Joules
%KE = Kinetic energy of the vehicle till it stops in Joules
%T_E = Total energy of the vehicle in Joules
%h = Handles the movement of the symbol corresponded to the selected
%    vehicle
%
%
%Programmer-defined Functions (Created by using GUIDE);
%
%accelerator(); Function to increase the speed by one metre per second
%brake(); Function to decrease the speed by one metre per second
%Close_button(); Function to close the GUI
%Height_0(); Function to store the user defined value of initial
%            height (in meters)
%Height_1();Function to store the user defined value of second
%            height (in meters)
%Height_2();Function to store the user defined value of third
%            height (in meters)
%Height_3();Function to store the user defined value of fourth
%            height (in meters)
%Height_4();Function to store the user defined value of fifth
%            height (in meters)
%Height_5();Function to store the user defined value of sixth
%            height (in meters)
%Height_6();Function to store the user defined value of seventh
%            height (in meters)
%Height_7();Function used to store the user defined value of eighth
%            height (in meters)
%Height_8();Function to store the user defined value of ninth
%            height (in meters)
%Height_9();Function to store the user defined value of tenth
%            height (in meters)
%Height_10();Function to store the user defined value of final
%            height (in meters)
%reset_button();Function to refresh the main GUI window
%simulate(); Function to show the main execution of program
%Speed_0(); Function to get the value of user defined initial speed (in kilometres first and then converting it to metres)
%Speed_1(); Function to get the value of first user defined additional speed (in kilometres first and then converting it to metres)
%Speed_2(); Function to get the value of second user defined additional
%speed (in kilometres first and then converting it to metres)
%Track_popupmenu(); Function to get the value of track outlook selected by
%                   user
%Vehicle_popupmenu();Function to get the value of vehicle selected by
%                   user
%P_analysis_panel();Function used to address the option for realtime ploting or
%simple plotting of energy curves (in Joules)

function varargout = Energy_Conservation_Analysis(varargin)
% ENERGY_CONSERVATION_ANALYSIS M-file for Energy_Conservation_Analysis.fig
%      ENERGY_CONSERVATION_ANALYSIS, by itself, creates a new ENERGY_CONSERVATION_ANALYSIS or raises the existing
%      singleton*.
%
%      H = ENERGY_CONSERVATION_ANALYSIS returns the handle to a new ENERGY_CONSERVATION_ANALYSIS or the handle to
%      the existing singleton*.
%
%      ENERGY_CONSERVATION_ANALYSIS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ENERGY_CONSERVATION_ANALYSIS.M with the given input arguments.
%
%      ENERGY_CONSERVATION_ANALYSIS('Property','Value',...) creates a new ENERGY_CONSERVATION_ANALYSIS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Energy_Conservation_Analysis_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Energy_Conservation_Analysis_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Energy_Conservation_Analysis

% Last Modified by GUIDE v2.5 07-Sep-2015 23:34:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Energy_Conservation_Analysis_OpeningFcn, ...
                   'gui_OutputFcn',  @Energy_Conservation_Analysis_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Energy_Conservation_Analysis is made visible.
function Energy_Conservation_Analysis_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Energy_Conservation_Analysis (see VARARGIN)

% Choose default command line output for Energy_Conservation_Analysis
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
%
%
% Normally Closed buttons
%
set(handles.brake,'Enable','off'); % Handles the 'Enable' property of brake button and switch it off
set(handles.accelerator,'Enable','off'); % Handles the 'Enable' property of accelerator button and switch it off

% UIWAIT makes Energy_Conservation_Analysis wait for user response (see UIRESUME)
% uiwait(handles.main_simulation_screen);


% --- Outputs from this function are returned to the command line.
function varargout = Energy_Conservation_Analysis_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in simulate.
function simulate_Callback(hObject, eventdata, handles)
% hObject    handle to simulate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%
%Plot Refreshing 
cla(handles.Hilly_Terrain_Plot); %refreshes the hilly terrain plot
cla(handles.Kinetic_Potential_Energy_Plot); %refreshes the energy plots
%
%Retrieval of values contained in their respective functions
%
h0=get(handles.Height_0,'UserData'); %retrieves the data stored in the 'UserData' property of editor box with a tag Height_0 and assign its value to h0
h1=get(handles.Height_1,'UserData'); %retrieves the data stored in the 'UserData' property of editor box with a tag Height_1 and assign its value to h1
h2=get(handles.Height_2,'UserData'); %retrieves the data stored in the 'UserData' property of editor box with a tag Height_2 and assign its value to h2
h3=get(handles.Height_3,'UserData'); %retrieves the data stored in the 'UserData' property of editor box with a tag Height_3 and assign its value to h3
h4=get(handles.Height_4,'UserData'); %retrieves the data stored in the 'UserData' property of editor box with a tag Height_4 and assign its value to h4
h5=get(handles.Height_5,'UserData'); %retrieves the data stored in the 'UserData' property of editor box with a tag Height_5 and assign its value to h5
h6=get(handles.Height_6,'UserData'); %retrieves the data stored in the 'UserData' property of editor box with a tag Height_6 and assign its value to h6
h7=get(handles.Height_7,'UserData'); %retrieves the data stored in the 'UserData' property of editor box with a tag Height_7 and assign its value to h7
h8=get(handles.Height_8,'UserData'); %retrieves the data stored in the 'UserData' property of editor box with a tag Height_8 and assign its value to h8
h9=get(handles.Height_9,'UserData'); %retrieves the data stored in the 'UserData' property of editor box with a tag Height_9 and assign its value to h9
h10=get(handles.Height_10,'UserData'); %retrieves the data stored in the 'UserData' property of editor box with a tag Height_10 and assign its value to h10
v0=get(handles.Speed_0,'UserData'); %retrieves the data stored in the 'UserData' ptoperty of editor box with a tag Speed_0 and assign its value to v0 
v1=get(handles.Speed_1,'UserData'); %retrieves the data stored in the 'UserData' ptoperty of editor box with a tag Speed_0 and assign its value to v1
v2=get(handles.Speed_2,'UserData'); %retrieves the data stored in the 'UserData' ptoperty of editor box with a tag Speed_0 and assign its value to v2
vehicle_one=get(handles.Vehicle_popupmenu,'UserData'); %gets the value corresponded to selected vehicle from 'UserData' property of Vehicle_popupmenu and assign its value to vehicle_one
radiopanel= get(handles.P_analysis_panel,'SelectedObject'); %obtaining the value of selected object into variable 'radiopanel'
track=get(handles.Track_popupmenu,'UserData');%retrieve the value form the 'UaerData' property of popupmenu for track graphics and store it as track
%
%Error Handling for Vehicle Popup menu
%
if (isempty(vehicle_one)|| vehicle_one==1) %If condition executes if the user forgot to select the vehicle or select 1 perhaps
    msgbox('Simulation requires the user to select the vehicle from Vehicle garage','Error Message','custom',imread('Vehicleselection.png'));%display the error message written in the quotation mark with an error sign
    return;%exit from the function
end %end of if conditional statement for handling unselected values of vehicles
%
%Error Handling for Track Popup menu
%
if (isempty(track))  % if condition executes there is no value in the track variable
    msgbox('Simulation requires the user to select from the options given in Track Outlook Panel','Error Message','custom',imread('TrackSelection.png')); %the statement displays the error message and aks the user to correct it before pressing simulate button
    return;% exits from the function
end % end of if construct
%
%Error Handling for Elevation Panel
%
if ((isempty(h0))| (isempty(h1))|(isempty(h2))| (isempty(h3))|(isempty(h4))|(isempty(h5))|(isempty(h6))|(isempty(h7))|(isempty(h8))|(isempty(h9))|(isempty(h10)))%if conditional statement executes if any of the elevation is left blank by the user
    msgbox('Please enter some authentic value for height.','Error Message');% Displays the error message to the user and prompt the user to enter the correct value again
    return;%exit from the function
end %end of if conditional statement for handling empty values of elevations
%
%Error Handling for Speed Panel
%
if ((isempty(v0))|(isempty(v1))|(isempty(v2)))%if conditional statement executes if any of the values of speed is left blank by the user
     msgbox('Please enter some authentic value for  speed.','Error Message');% Displays the error message to the user and prompt the user to enter the correct value again
    return;%exit from the function
end %end of if conditional statement for handling empty values of speed
%
%Assignment of Standard value for Acceleration due to Gravity
%
g=9.81; %assignment of gravitational acceleration value (that is 9.81 metres/second square) to variable g
%
%Assignment of retrieve values in order to form an array
%
y=[h0 h1 h2 h3 h4 h5 h6 h7 h8 h9 h10];% creating an array of eleven elements taken from their respective editor box
x=linspace(0.00001,50, length(y)); % second way of creating an array using linspace function of length equal to the length of array y
xactual= 0.00001:0.01:50; % third way of creating an array using colon, the array mainly requires the first and second element and the increment interval as represented by 0.01 in statement 
yactual= interp1(x,y,xactual,'spline'); % forming the array with interp1 function which arranges the values of elevations(yactual) with respect to the xactual so that their plot would form a curve shaped line
%
%Loop for correcting any negative interpolated value of height
%
for k=1:length(yactual); %for loop iteration with the counter k.It starts from 1 till the length of yactual
    if yactual(k)<1 % if conditional triggers if any of the value of interpolated array (yactual) is less than one
        yactual(k)=1;% assign it to be one in order to get whole value
    end % end of if condition for handling negative heights
end % end of loop
%%
%Sound Effects for starting vehicle
%
aud= audioread('Engine_start.wav');% read the audio file name 'Engine_start.wav' from the current folder and assign it as 'aud'
sound(aud);%play the audio file with the default frequency
%%
%Section Code for Track graphics
%
switch(track)% switch structure for different values of track area
   case 1 % if the value of track is one
    msgbox('No Track area is selected','Error Message','custom',imread('TrackSelection.png'));%error message will popup informing the user that no track is selected
    return;% in order to select the track the statement helps in exiting from the function
   case 2 % if the value of track is two
     axes(handles.Hilly_Terrain_Plot); %handling the axis plot with the name'Hilly_Terrain_Plot' with axes function
     area(xactual,yactual),title('Hilly Terrain in Desert area'),xlabel('Distance (in kilometres)'),ylabel('Height (in metres)'), colormap([1 0.8 0.36]);% plotting the graph between distance and height, with proper labelling and title and colouring the area to desert brown by changing the amount of red, green and blue colour in colormap function.
   case 3 % if the value of track is three
     axes(handles.Hilly_Terrain_Plot); %handling the axis plot with the name'Hilly_Terrain_Plot' with axes function
     area(xactual,yactual),title('Hilly Terrain in Rocky region'),xlabel('Distance (in kilometres)'),ylabel('Height (in metres)'), colormap([0.26 0.26 0.26]);% plotting the graph between distance and height, with proper labelling and title and colouring the area to rocky grey by changing the amount of red, green and blue colour in colormap function.
   case 4 % if the value of track is four
     axes(handles.Hilly_Terrain_Plot); %handling the axis plot with the name'Hilly_Terrain_Plot' with axes function
     area(xactual,yactual),title('Hilly Terrain in Muddy soil'),xlabel('Distance (in kilometres)'),ylabel('Height (in metres)'), colormap([1 0.5 0]);% plotting the graph between distance and height, with proper labelling and title and colouring the area to muddy brown by changing the amount of red, green and blue colour in colormap function.
   case 5 % if the value of track is five
        axes(handles.Hilly_Terrain_Plot); %handling the axis plot with the name'Hilly_Terrain_Plot' with axes function
        area(xactual,yactual),title('Hilly Terrain in Lush Valley'),xlabel('Distance (in kilometres)'),ylabel('Height (in metres)'), colormap([0 0.26 0]);% ploting the graph between distance and height, with proper labelling and title and colouring the area to royal green by changing the amount of red, green and blue colour in colormap function.       
    otherwise % this case will not executes for track popup menu as options are definite
end % end of switch conditional structure
% Background Colour
axes(handles.Hilly_Terrain_Plot);% again addressing the same plot with axes function
set(handles.Hilly_Terrain_Plot,'Color',[0 0.9 0.9]);% changing the background to light blue using colour property of Hilly_Terrain_Plot using set function
hold on; %holds the plotted terrain with the background colour otherwise the point considered motion of vehicle will not be observed
%%
%Section Code for assigning selected vehicle specification to the
%variables
%
switch (vehicle_one)% switch conditional structure for different values of variable vehicle_one
    case 1 % if the value of track is one
    msgbox('No vehicle is selected','Error Message','custom',imread('errorsign.png'));%error message will popup informing the user that no vehicle is selected before pressing simulate button
    return; %exit from the function so that user can select vehicle
    case 2 % if the value of track is two
        m= 2615; %assigning the value of m in correspondent to selected vehicle's curb weight (in kilograms) 
        vmax= 55.56; %assigning the value of vmax according to selected vehicle's top speed (in metres per second)
        h=plot(xactual(1),yactual(1),'ks'); %plot the first element of yactual with respect to xactual and represent it with black square symbol
    case 3 % if the value of track is three
        m=1721; %assigning the value of m in correspondent to selected vehicle's curb weight (in kilograms)
        vmax= 87.5;%assigning the value of vmax according to selected vehicles's top speed (in metres per second)
        h=plot(xactual(1),yactual(1),'b>'); %plot the first element of yactual with respect to xactual and represent it with blue colour traingle(right) symbol
    case 4 % if the value of track is four
        m= 286; %assigning the value of m in correspondent to selected vehicle's curb weight (in kilograms)
        vmax= 33.33; %assigning the value of vmax according to selected vehicle's top speed (in metres per second)
        h=plot(xactual(1),yactual(1),'ro');%plot the first element of yactual with respect to xactual and represent it with red colour circle symbol
    otherwise %this part of switch will not executes for vehicles popup menu
end %end of switch structure for vehicles
%
%Error handling for exceeded vehicle's speed
%
switch(vmax) %switch structure for comparing the entered speed with maximum speed
    case v0>vmax %if the initial speed is greater than vehicle's top speed 
         v0= vmax; %then with respect to the user high speed desire, assign the initial speed to the maximum possible top speed of the selected vehicle
    case v1>vmax %if the first additional speed is greater than vehicle's top speed 
         v1= 0; %since its additional speed and if the user is trying to enter the additional speed greater than top speed then the resultant speed will be very high so probably the vehicle's engine will go down hence first additional speed will becomes zero to ensure safety of driver
    case v2>vmax %if the second additional speed is greater than vehicle's top speed 
         v2= 0; %since its additional speed and if the user is trying to enter the additional speed greater than top speed then the resultant speed will be very high so probably the vehicle's engine will go down hence second additional speed will becomes zero to ensure safety of driver
    otherwise %not neessary condition for this case
end %end of switch structure for countering speed greater than top speed
%%
%Initialization of Variables
%
K_E=ones(1,length(xactual)); %initializing the array of ones, with the length equal to the length of xactual for kinetic energy
P_E=zeros(1,length(xactual)); %initializing  the array of zeros, with the length equal to the length of xactual for potential energy
T_E=zeros(1,length(xactual)); %%initializing  the array of zeros, with the length equal to the length of xactual for total energy
v=zeros(1,length(xactual)); %initializing  the array of zeros, with the length equal to the length of xactual for speed
%%
%Switching off all the buttons that might interfere with simulation 
%
%
set(handles.Close_button,'Enable','off'); % Handles the 'Enable' property of close button and switch it off
set(handles.reset_button,'Enable','off'); % Handles the 'Enable' property of reset button and switch it off
set(handles.brake,'Enable','on'); %handles the 'Enable' property of brake button and switch it on so that user can decrease the speed during simulation
set(handles.accelerator,'Enable','on'); %handles the 'Enable' property of accelerator button and switch it on so that user can increase the speed during simulation
set(handles.Height_0,'Enable','off'); %handles the 'Enable' property of Height_0 button and switch it off, in order to prevent the user form changing the values during simulation
set(handles.Height_1,'Enable','off'); %handles the 'Enable' property of Height_1 button and switch it off, in order to prevent the user form changing the values during simulation
set(handles.Height_2,'Enable','off'); %handles the 'Enable' property of Height_2 button and switch it off, in order to prevent the user form changing the values during simulation
set(handles.Height_3,'Enable','off'); %handles the 'Enable' property of Height_3 button and switch it off, in order to prevent the user form changing the values during simulation
set(handles.Height_4,'Enable','off'); %handles the 'Enable' property of Height_4 button and switch it off, in order to prevent the user form changing the values during simulation
set(handles.Height_5,'Enable','off'); %handles the 'Enable' property of Height_5 button and switch it off, in order to prevent the user form changing the values during simulation
set(handles.Height_6,'Enable','off'); %handles the 'Enable' property of Height_6 button and switch it off, in order to prevent the user form changing the values during simulation
set(handles.Height_7,'Enable','off'); %handles the 'Enable' property of Height_7 button and switch it off, in order to prevent the user form changing the values during simulation
set(handles.Height_8,'Enable','off'); %handles the 'Enable' property of Height_8 button and switch it off, in order to prevent the user form changing the values during simulation
set(handles.Height_9,'Enable','off'); %handles the 'Enable' property of Height_9 button and switch it off, in order to prevent the user form changing the values during simulation
set(handles.Height_10,'Enable','off'); %handles the 'Enable' property of Height_10 button and switch it off, in order to prevent the user form changing the values during simulation
set(handles.Speed_0,'Enable','off'); %handles the 'Enable' property of Speed_0 button and switch it off, in order to prevent the user form changing the values during simulation
set(handles.Speed_1,'Enable','off'); %handles the 'Enable' property of Speed_1 button and switch it off, in order to prevent the user form changing the values during simulation
set(handles.Speed_2,'Enable','off'); %handles the 'Enable' property of Speed_2 button and switch it off, in order to prevent the user form changing the values during simulation
set(handles.Track_popupmenu,'Enable','off'); %handles the 'Enable' property of Track_popupmenu  and switch it off, in order to prevent the user form changing the values during simulation
set(handles.Vehicle_popupmenu,'Enable','off'); %handles the 'Enable' property of Vehicle_popupmenu  and switch it off, in order to prevent the user form changing the values during simulation
set(handles.P_analysis_panel,'Visible','off'); %restricts the user to change it during execution
%%
%Code for user selected plotting scheme
%
choice= get(radiopanel,'String'); %converting the value assigned to variable 'radiopanel' to string and assigning the string value to choice
switch(choice) %switch structure for string variable 
    case 'Realtime Plotting' %if the choice is 'Realtime Plotting'
        plottype=2; %assign 2 to variable  'plottype'
    case 'Simple Plotting' %if the choice is 'Simple Plotting'
        plottype=1; %assigns 1 to variable 'plottype'
    otherwise %since its only two options so otherwise statements are not required
end % end of switch structure
%%
%Loop for Hilly Terrain Simulation
%
%
for k=1:numel(xactual) %for loop construct with a counter k of length equal to the length of xactual. The starting point is 1.
       P_E(k)=m*g*yactual(k); %expression for calculating potential energy of the vehicle at each elevation point
       if (k==1) % If-Elseif-Else construct. If condition for the first loop, when the value of k is 1.
            v(k)=v0; %assigning the first component of speed array the value of initial speed
       elseif(k==length(xactual(xactual<20))+1) %elseif expression to find out the index of element 20 in array xactual
              v(k)=v(k-1)+v1; %expression for determining the speed of the vehicle at 20 kilometres
       elseif (k==length(xactual(xactual<40))+1) %elseif expression to find out the index of element 40 in array xactual
              v(k)=v(k-1)+v2; %expressing for evaluating the vehicle speed at 40 kilometres
       else %the default path if none of the above conditions were true 
      
          v(k)=sqrt((P_E(k-1)-P_E(k)+0.5*m*(v(k-1))^2)/(0.5*m)); %expression for determining the final velocity between two points
       end %end of If-elseif-else construct
   %
   %Code for application of Brake
   %   
      if(get(handles.brake,'UserData')==1) %if condition executes when the brake button is pressed by the user 
         v(k)= v(k)-1; %decrement in speed by one
         set(handles.brake,'UserData',0) %reset the value of brake button for continuous use
      end %end of if conditional statement for brake
    %
    %Code for zero speed
    %
    if (v(k)<=0 & yactual(k)<yactual(k+1) || (v(k)<=0 & yactual(k)==yactual(k+1))) %if conditional statement executes when the speed becomes zero or less than zero and the hill is steep 
        msgbox('Not more energy for a vehicle to move','Message');%Shows the user that the vehicle would be able to move further
        PE=P_E(1:k);%copying the value of potential energy till the speed becomes zero into another vector
        KE=K_E(1:k);%copying the value of kinetic energy till the speed becomes zero another vector
        break;% Exits from the loop
    end %end of If conditional statement for countering zero speed value
    %
    %Controlling the speed when vehicle comes down the hill or when the
    %speed of vehicle approaches maximum speed
    %
    if(yactual(k)>yactual(k+1) || v(k)==vmax) %If construct with above mentioned condition
       set(handles.accelerator,'Enable','off'); %Switching off the accelerator in ensure safety 
    else % the default option if the slope is not decreasing
       set(handles.accelerator,'Enable','on'); %switching on the accelerator
    end% end of if construct
    %
    %Code for increasing vehicle's speed
    %
    if  (get(handles.accelerator,'UserData')==2) %if condition executes when the accelerator button is pressed by the user 
       v(k)= v(k)+1; %decrement in speed by one
       set(handles.accelerator,'UserData',0) %%reset the value of accelerator button for repetitive use
    end %end of if construct for acceleration
    %
    %Evaluation of Kinetic and Total energy of the vehicle
    %
    K_E(k)=0.5*m*(v(k)^2); %expression for determining kinetic energy to record speed change due to accelerator or brake
    T_E(k)= K_E(k)+P_E(k); %expression for finding out the total energy of the system at a point
    %
    %Real time Motion of Vehicle on the terrain
    %
    set(h,'xdata',xactual(k),'yData',yactual(k)); %move the position of the selected symbol as the xactual (horizontal data) and yactual(vertical data) element increases with counter
    %
    %Plotting of real time plotting of kinetic and potential energy
    %
    if(plottype==2) %If construct for real time plotting
    axes(handles.Kinetic_Potential_Energy_Plot); %addressing the plots name 'Kinetic_Potential_Energy_Plot'.
    plot(xactual(k),K_E(k),'b',xactual(k),P_E(k),'c');%plotting the k elements of Kinetic and potential energy with respect to distance in kilometres.
    xlim([0.00001 50]); %limits the x-axis
    legend('Kinetic Energy','Potential Energy');%plots the kinetic and potential energy (in Joules), with blue and cyan colour respectively, with respect to distance (in kilometres). The legend function is used to identify them on the plot. 
    title('Kinetic and Potential energy'),xlabel('Distance (in kilometres)'),ylabel('Energy (in Joules)'); %title, xlabel and ylabel functions gives the main title to the plot, label it x and y-axis respectively.
    grid on; % display the plot with grid lines
    hold on; % displaying the previous position of plot
    end%end of if statement
    drawnow;%pause(0.000005); %delay the loop for 5 micro seconds
    set(handles.speed,'String',v(k));
end %end of for iterative loop
%%
hold off;% turn off the plot addition 
%%
%Code for plotting kinetic and potential energy at the end of the loop
%
axes(handles.Kinetic_Potential_Energy_Plot); %addresses the handles parameter for plot name'Kinetic_Potential_Energy_Plot' in order to make it current figure
if(k==length(xactual)) %if the speed of the vehicle does not becomes zero during simulation
   plot(xactual,K_E,'b',xactual,P_E,'c'), legend('Kinetic Energy','Potential Energy');%plots the kinetic and potential energy (in Joules), with blue and cyan colour respectively, with respect to distance (in kilometres). The legend function is used to identify them on the plot. 
   title('Kinetic and Potential energy'),xlabel('Distance (in kilometres)'),ylabel('Energy (in Joules)'); %title, xlabel and ylabel functions gives the main title to the plot, label it x and y-axis respectively.
   grid on; % shows the grid lines on the plot
else %the default option
    xgrap=xactual(1:k); %creating the array of same length as the variable PE
    plot(xgrap,KE,'b',xgrap,PE,'c'), legend('Kinetic Energy','Potential Energy');%plots the extracted kinetic and potential energy (in Joules), with blue and cyan colour respectively, with respect to distance (in kilometres). The legend function is used to identify them on the plot.
    title('Kinetic and Potential energy'),xlabel('Distance (in kilometres)'),ylabel('Energy (in Joules)'); %title, xlabel and ylabel functions gives the main title to the plot, label it x and y-axis respectively.
    xlim([0.00001 50]);%fixed the limits x axis
    grid on; % shows the grid lines on the plot
end %end of If-else construct
%%
%Switching on all the buttons for user input
%
set(handles.P_analysis_panel,'Visible','on'); % handles the 'Visible property of button panel group and switch it on.
set(handles.Height_0,'Enable','on'); %handles the 'Enable' property of edit box 'Height_0' and switch it on.
set(handles.Height_1,'Enable','on'); %handles the 'Enable' property of edit box 'Height_1' and switch it on.
set(handles.Height_2,'Enable','on'); %handles the 'Enable' property of edit box 'Height_2' and switch it on.
set(handles.Height_3,'Enable','on'); %handles the 'Enable' property of edit box 'Height_3' and switch it on.
set(handles.Height_4,'Enable','on'); %handles the 'Enable' property of edit box 'Height_4' and switch it on.
set(handles.Height_5,'Enable','on'); %handles the 'Enable' property of edit box 'Height_5' and switch it on.
set(handles.Height_6,'Enable','on'); %handles the 'Enable' property of edit box 'Height_6' and switch it on.
set(handles.Height_7,'Enable','on'); %handles the 'Enable' property of edit box 'Height_7' and switch it on.
set(handles.Height_8,'Enable','on'); %handles the 'Enable' property of edit box 'Height_8' and switch it on.
set(handles.Height_9,'Enable','on'); %handles the 'Enable' property of edit box 'Height_9' and switch it on.
set(handles.Height_10,'Enable','on'); %handles the 'Enable' property of edit box 'Height_10' and switch it on.
set(handles.Speed_0,'Enable','on'); %handles the 'Enable' property of edit box 'Speed_0' and switch it on.
set(handles.Speed_1,'Enable','on'); %handles the 'Enable' property of edit box 'Speed_1' and switch it on.
set(handles.Speed_2,'Enable','on'); %handles the 'Enable' property of edit box 'Speed_2' and switch it on.
set(handles.Vehicle_popupmenu,'Enable','on'); %handles the 'Enable' property of popup menu for vehicle selection and switch it on.
set(handles.Track_popupmenu,'Enable','on'); %handles the 'Enable' property of popup menu for track graphics and switch it on.
set(handles.Close_button,'Enable','on'); %handles the 'Enable' property of reset button and switch it on so that user may reset the values.
set(handles.reset_button,'Enable','on'); %handles the 'Enable' property of close button and switch it on if the user wants to exit.







% --- Executes on button press in reset_button.
function reset_button_Callback(hObject, eventdata, handles)
% hObject    handle to reset_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close(gcbf); %closes the current base figure
Energy_Conservation_Analysis(); %opens the main simulation function again 




% --- Executes on button press in Close_button.
function Close_button_Callback(hObject, eventdata, handles)
% hObject    handle to Close_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%should display some help about the program

uiwait(msgbox('Thank you for using the program press ok to proceed','Exit','custom',imread('Exit.png'))); %Ending statement of program
close('all'); %closes all the open windows


% --- Executes on selection change in Vehicle_popupmenu.
function Vehicle_popupmenu_Callback(hObject, eventdata, handles)
% hObject    handle to Vehicle_popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Vehicle_popupmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Vehicle_popupmenu

vehicle_one= get(handles.Vehicle_popupmenu,'Value'); %get the corresponding value of the selected option and store it as vehicle_one
switch (vehicle_one) %switch construct to handle different options of popup menu
    case 1 %if the user selects option 1
        msgbox('No vehicle is selected','Error Message','custom',imread('Vehicleselection.png')); %display the error message to the user
    case 2 %if the user selects option 1
        axes(handles.Vehicle_Image); %addresses the 'Vehicle_Image' plot using axes function
    
        imshow(imread('ToyotaLand_Cruiser2015.jpg')),xlabel('Top Speed = 200 km/h & Curb Weight = 2615 kg'),title('Toyota Land Cruiser 2015'); %display the image of the selected vehicle, with major specifications and title.
    case 3 %if the user selects option 1
        axes(handles.Vehicle_Image); %addresses the 'Vehicle_Image' plot using axes function
        imshow(imread('Lamborghini_Aventador_LP7004_2012.jpg')),xlabel('Top Speed = 350 km/h & Curb Weight = 1721 kg'), title('Lamborghini Aventador LP-700-4 Roadster'); %display the image of the selected vehicle, with major specifications and title.
    case 4 %if the user selects option 1
         axes(handles.Vehicle_Image); %addresses the 'Vehicle_Image' plot using axes function
        imshow(imread('Honda_FourTrax_Foreman2014.jpg')),xlabel('Top Speed = 120 km/h & Curb Weight = 286 kg'),title('Honda FourTrax Foreman 2014'); %display the image of the selected vehicle, with major specifications and title.
    otherwise %this part will not be executed
end %end of switch structure
set(handles.Vehicle_popupmenu,'UserData',vehicle_one); %saves the selected value of the vehicle in the 'UserData' property of popup menu

% --- Executes during object creation, after setting all properties.
function Vehicle_popupmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Vehicle_popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Speed_1_Callback(hObject, eventdata, handles)
% hObject    handle to Speed_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Speed_1 as text
%        str2double(get(hObject,'String')) returns contents of Speed_1 as a double

v_1= str2double(get(handles.Speed_1,'String')); %convert the string value of editor box 'Speed_1' and stores it as v_1 in kilometres per hour
if(isnan(v_1)| v_1<0) %%if condition executes if the user accidently key in any alphabets or if the user enters negative first additional speed
    msgbox('Please give appropriate value to the first additional speed ','Error Message','custom',imread('errorsign.png')); %message box will prompt the user to re modify the entered value
end %end of if conditional statement
v1= (v_1*1000)/3600; %expression to convert the first additional speed from kilometres per hour to metres per second
set(handles.Speed_1,'UserData',v1); %Saves the modified value of speed


% --- Executes during object creation, after setting all properties.
function Speed_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Speed_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Speed_2_Callback(hObject, eventdata, handles)
% hObject    handle to Speed_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Speed_2 as text
%        str2double(get(hObject,'String')) returns contents of Speed_2 as a double

v_2= str2double(get(handles.Speed_2,'String')); %convert the string value of editor box 'Speed_2' and stores it as v_2 in kilometres per hour
if(isnan(v_2)| v_2<0) %if condition executes if the user accidently key in any alphabets or if the user enters negative second additional speed
    msgbox('Please give appropriate value to the second additional speed ','Error Message','custom',imread('errorsign.png'));%message box will prompt the user to re modify the entered value
end %end of if conditional statement
v2= (v_2*1000)/3600; %expression to convert the second additional speed from kilometres per hour to metres per second
set(handles.Speed_2,'UserData',v2); %Saves the modified value of speed


% --- Executes during object creation, after setting all properties.
function Speed_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Speed_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Speed_0_Callback(hObject, eventdata, handles)
% hObject    handle to Speed_0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Speed_0 as text
%        str2double(get(hObject,'String')) returns contents of Speed_0 as a double

v_0= str2double(get(handles.Speed_0,'String')); %convert the string value of editor box 'Speed_0' and stores it as v_0 in kilometres per hour
if(isnan(v_0) || v_0<0) %if condition executes if the user accidently key in any alphabets or if the user enters negative initial speed
    msgbox('Please give appropriate positive value or zero to the initial speed','Error Message','custom',imread('errorsign.png')); %message box will prompt the user to re modify the entered value
end %end of if conditional statement
v0= (v_0*1000)/3600; %expression to convert the initial speed from kilometres per hour to metres per second
set(handles.Speed_0,'UserData',v0); %Saves the modified value of speed 

% --- Executes during object creation, after setting all properties.
function Speed_0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Speed_0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in accelerator.
function accelerator_Callback(hObject, eventdata, handles)
% hObject    handle to accelerator (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Accelerator = 2; %Assigns the value 2 to Accelerator variable
set(handles.accelerator,'UserData',Accelerator); %saves the value in the 'UserData' property of button

% --- Executes on button press in brake.
function brake_Callback(hObject, eventdata, handles)
% hObject    handle to brake (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Brake = 1; %Assigns the value 1 to Brake variable
set(handles.brake,'UserData',Brake); %saves the value in the 'UserData' property of button

% --- Executes on selection change in Track_popupmenu.
function Track_popupmenu_Callback(hObject, eventdata, handles)
% hObject    handle to Track_popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Track_popupmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Track_popupmenu

track= get(handles.Track_popupmenu,'Value');% gets the selected value of terrain area
set(handles.Track_popupmenu,'UserData',track); %Saves the selected value of track in the 'UserData' property of the popup menu


% --- Executes during object creation, after setting all properties.
function Track_popupmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Track_popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Height_1_Callback(hObject, eventdata, handles)
% hObject    handle to Height_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Height_1 as text
%        str2double(get(hObject,'String')) returns contents of Height_1 as a double

h1= str2double(get(handles.Height_1,'String')); %gets the user entered value of first height and convert it into number
if (isnan(h1)|| h1<1 || h1>1000)                %if the converted value is not a number or is less than 1 or is greater than 1000 metres
    msgbox('Please enter the the second height again','Error Message','custom',imread('errorsign.png')) % In the statement the msgbox shows a dialog box with title error message and copy the message written under single quotation mark
end % end of if construct
set(handles.Height_1,'UserData',h1); %Stores the modified value as h1 in the 'UserData' property of Height_1


% --- Executes during object creation, after setting all properties.
function Height_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Height_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Height_2_Callback(hObject, eventdata, handles)
% hObject    handle to Height_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Height_2 as text
%        str2double(get(hObject,'String')) returns contents of Height_2 as a double

h2= str2double(get(handles.Height_2,'String')); %gets the user entered value of second height and convert it into number
if (isnan(h2)|| h2<1 || h2>1000)                %if the converted value is not a number or is less than 1 or is greater than 1000 metres
    msgbox('Please enter the third height again','Error Message','custom',imread('errorsign.png')) % In the statement the msgbox shows a dialog box with title error message and copy the message written under single quotation mark
end % end of if construct
set(handles.Height_2,'UserData',h2); %Stores the modified value as h2 in the 'UserData' property of Height_2


% --- Executes during object creation, after setting all properties.
function Height_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Height_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Height_3_Callback(hObject, eventdata, handles)
% hObject    handle to Height_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Height_3 as text
%        str2double(get(hObject,'String')) returns contents of Height_3 as a double

h3= str2double(get(handles.Height_3,'String')); %gets the user entered value of third height and convert it into number
if (isnan(h3)|| h3<1 || h3>1000)                %if the converted value is not a number or is less than 1 or is greater than 1000 metres
    msgbox('Please enter the the fourth height again','Error Message','custom',imread('errorsign.png')) % In the statement the msgbox shows a dialog box with title error message and copy the message written under single quotation mark
end % end of if construct
set(handles.Height_3,'UserData',h3); %Stores the modified value as h3 in the 'UserData' property of Height_3



% --- Executes during object creation, after setting all properties.
function Height_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Height_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Height_4_Callback(hObject, eventdata, handles)
% hObject    handle to Height_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Height_4 as text
%        str2double(get(hObject,'String')) returns contents of Height_4 as a double

h4= str2double(get(handles.Height_4,'String')); %gets the user entered value of fourth height and convert it into number
if (isnan(h4)|| h4<1 || h4>1000)                %if the converted value is not a number or is less than 1 or is greater than 1000 metres
    msgbox('Please enter the the fifth height again','Error Message','custom',imread('errorsign.png')) % In the statement the msgbox shows a dialog box with title error message and copy the message written under single quotation mark
end % end of if construct
set(handles.Height_4,'UserData',h4); %Stores the modified value as h4 in the 'UserData' property of Height_4


% --- Executes during object creation, after setting all properties.
function Height_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Height_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Height_5_Callback(hObject, eventdata, handles)
% hObject    handle to Height_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Height_5 as text
%        str2double(get(hObject,'String')) returns contents of Height_5 as a double

h5= str2double(get(handles.Height_5,'String')); %gets the user entered value of fifth height and convert it into number
if (isnan(h5)|| h5<1 || h5>1000)                %if the converted value is not a number or is less than 1 or is greater than 1000 metres
    msgbox('Please enter the the sixth height again','Error Message','custom',imread('errorsign.png')) % In the statement the msgbox shows a dialog box with title error message and copy the message written under single quotation mark
end % end of if construct
set(handles.Height_5,'UserData',h5); %Stores the modified value as h5 in the 'UserData' property of Height_5




% --- Executes during object creation, after setting all properties.
function Height_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Height_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Height_7_Callback(hObject, eventdata, handles)
% hObject    handle to Height_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Height_7 as text
%        str2double(get(hObject,'String')) returns contents of Height_7 as a double

h7= str2double(get(handles.Height_7,'String')); %gets the user entered value of seventh height and convert it into number
if (isnan(h7) || h7<1 || h7>1000)               %if the converted value is not a number or is less than 1 or is greater than 1000 metres
    msgbox('Please enter the the eighth height again','Error Message','custom',imread('errorsign.png')) % In the statement the msgbox shows a dialog box with title error message and copy the message written under single quotation mark
end % end of if construct
set(handles.Height_7,'UserData',h7); %Stores the modified value as h7 in the 'UserData' property of Height_7


% --- Executes during object creation, after setting all properties.
function Height_7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Height_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Height_6_Callback(hObject, eventdata, handles)
% hObject    handle to Height_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Height_6 as text
%        str2double(get(hObject,'String')) returns contents of Height_6 as a double

h6= str2double(get(handles.Height_6,'String')); %gets the user entered value of sixth height and convert it into number
if (isnan(h6)|| h6<1 || h6>1000)                %if the converted value is not a number or is less than 1 or is greater than 1000 metres
    msgbox('Please enter the the seventh height again','Error Message','custom',imread('errorsign.png')) % In the statement the msgbox shows a dialog box with title error message and copy the message written under single quotation mark
end % end of if construct
set(handles.Height_6,'UserData',h6); %Stores the modified value as h5 in the 'UserData' property of Height_5



% --- Executes during object creation, after setting all properties.
function Height_6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Height_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Height_8_Callback(hObject, eventdata, handles)
% hObject    handle to Height_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Height_8 as text
%        str2double(get(hObject,'String')) returns contents of Height_8 as a double

h8= str2double(get(handles.Height_8,'String')); %gets the user entered value of eighth height and convert it into number
if (isnan(h8) || h8<1 || h8>1000)               %if the converted value is not a number or is less than 1 or is greater than 1000 metres
    msgbox('Please enter the the ninth height again','Error Message','custom',imread('errorsign.png'))
end % end of if construct
set(handles.Height_8,'UserData',h8); %Stores the modified value as h8 in the 'UserData' property of Height_8



% --- Executes during object creation, after setting all properties.
function Height_8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Height_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Height_9_Callback(hObject, eventdata, handles)
% hObject    handle to Height_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Height_9 as text
%        str2double(get(hObject,'String')) returns contents of Height_9 as a double

h9= str2double(get(handles.Height_9,'String')); %gets the user entered value of ninth height and convert it into number
if (isnan(h9) || h9<1 || h9>1000)               %if the converted value is not a number or is less than 1 or is greater than 1000 metres
    msgbox('Please enter the the tenth height again','Error Message','custom',imread('errorsign.png')) % In the statement the msgbox shows a dialog box with title error message and copy the message written under single quotation mark
end % end of if construct
set(handles.Height_9,'UserData',h9); %Stores the modified value of h9 in the 'UserData' property of Height_9


% --- Executes during object creation, after setting all properties.
function Height_9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Height_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Height_10_Callback(hObject, eventdata, handles)
% hObject    handle to Height_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Height_10 as text
%        str2double(get(hObject,'String')) returns contents of Height_10 as a double

h10= str2double(get(handles.Height_10,'String')); %gets the user entered value of final height and convert it into number
 if (isnan(h10)|| h10<1 || h10>1000)              %if the converted value is not a number or is less than 1 or is greater than 1000 metres
    msgbox('Please enter the the final height again','Error Message','custom',imread('errorsign.png')) % In the statement the msgbox shows a dialog box with title error message and copy the message written under single quotation mark
 end % end of if construct
set(handles.Height_10,'UserData',h10); %Stores the modified value as h10 in the 'UserData' property of Height_10


% --- Executes during object creation, after setting all properties.
function Height_10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Height_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Height_0_Callback(hObject, eventdata, handles)
% hObject    handle to Height_0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Height_0 as text
%        str2double(get(hObject,'String')) returns contents of Height_0 as a double

h0= str2double(get(handles.Height_0,'String')); %gets the user entered value of initial height and convert it into number
if (isnan(h0)|| h0<1 || h0>1000)                %if the converted value is not a number or is less than 1 or is greater than 1000 metres than only IF conditional statements triggers
    msgbox('Please enter the the initial height again','Error Message','custom',imread('errorsign.png')) % In the statement the msgbox shows a dialog box with title error message and copy the message written under single quotation mark
end                                              % represents ending of the conditional statement
set(handles.Height_0,'UserData',h0);             % takes the corrected value and stores it in the UserData property of the function and name it as h0



% --- Executes during object creation, after setting all properties.
function Height_0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Height_0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes when user attempts to close main_simulation_screen.
function main_simulation_screen_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to main_simulation_screen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Hint: delete(hObject) closes the figure
delete(hObject);


% --- Executes when selected object is changed in P_analysis_panel.
function P_analysis_panel_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in P_analysis_panel 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
