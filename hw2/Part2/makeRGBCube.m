% Problem 2a

clear all; close all; clc;

%% Define Vertices
topVerts = [ 0 1 0; 0 1 1; 1 1 1; 1 1 0];
topVertIndex = [ 1 2 3 4 ];
botVerts = [ 0 0 0; 0 0 1; 1 0 1; 1 0 0];
botVertIndex = [ 5 6 7 8 ];

verts = [ topVerts; botVerts ];

%% Define Colors (Your efforts here)
vertColors=verts;
%% Empty faces list
faces = [];

%% Top faces
faces = [ faces ; 1 2 3 ; 1 3 4 ];

%% Side faces (Your efforts here)
for vertI = 1 : 4
	faceVert1 = topVertIndex( mod(vertI,4)+1 );
	faceVert2 = topVertIndex( vertI );
	faceVert3 = botVertIndex( vertI );
	faces = [ faces ; faceVert1 faceVert2 faceVert3 ];
end
for vertI = 1 : 4
	faceVert1 = botVertIndex( vertI );
	faceVert2 = botVertIndex( mod(vertI,4)+1 );
	faceVert3 = topVertIndex( mod(vertI,4)+1 );
	faces = [ faces ; faceVert1 faceVert2 faceVert3 ];
end

%% Bottom faces
faces = [ faces ; 5 7 6 ; 5 8 7 ];

%% Write to .obj File
writeColorObj( 'RGBCube.obj', verts, vertColors, faces );

%% Problem 2b
numOfVert=60;
vertsPolarAngle=linspace(0, 2*pi, numOfVert+1)';
vertsX=cos(vertsPolarAngle);
vertsY=sin(vertsPolarAngle);
%% Define Vertices
height=pi;
topVerts = [vertsX vertsY ones(numOfVert+1, 1)*height];
topVertIndex = 1:1:numOfVert+1;
botVerts = [ vertsX vertsY zeros(numOfVert+1, 1)];
botVertIndex = numOfVert+2:1:(numOfVert+1)*2;

topCenter=[0 0 height];
topCenterIndex=2*(numOfVert+1)+1;

BotCenter=[0 0 0];
botCenterIndex=2*(numOfVert+1)+2;
verts = [ topVerts; botVerts ;topCenter;BotCenter];
%% Define Colors 
% vertColors=zeros(size(verts));
hsvTopColors=[vertsPolarAngle/2/pi ones(numOfVert+1, 1) ones(numOfVert+1, 1)];
hsvBottomColors=[vertsPolarAngle/2/pi ones(numOfVert+1, 1) zeros(numOfVert+1, 1)];
topCenterColor=[0 0 1];
botCenterColor=[1 0 0];
vertColors=hsv2rgb([hsvTopColors; hsvBottomColors;topCenterColor;botCenterColor]);
%% Empty faces list
faces = [];
%% Top faces
for vertI=1:numOfVert
    faces = [ faces ; topVertIndex( vertI ) topVertIndex( vertI+1 ) topCenterIndex];
end
faces = [ faces ; topVertIndex( numOfVert+1 ) topVertIndex( 1 ) topCenterIndex];

%% Side faces
for vertI = 1 : numOfVert
	faceVert1 = topVertIndex( vertI+1 );
	faceVert2 = topVertIndex( vertI );
	faceVert3 = botVertIndex( vertI );
	faces = [ faces ; faceVert1 faceVert2 faceVert3 ];
end
faces = [ faces ;  topVertIndex( 1 ) topVertIndex( numOfVert+1 ) botVertIndex( 1 )];

for vertI = 1 : numOfVert
	faceVert1 = botVertIndex( vertI );
	faceVert2 = botVertIndex( vertI+1 );
	faceVert3 = topVertIndex( vertI+1 );
	faces = [ faces ; faceVert1 faceVert2 faceVert3 ];
end
faces = [ faces ; botVertIndex( numOfVert ) botVertIndex( 1 ) topVertIndex( numOfVert )];
%% Bottom faces
for vertI=1:numOfVert
    faces = [ faces ; botVertIndex( vertI ) botVertIndex( vertI+1 ) botCenterIndex];
end
faces = [ faces ; botVertIndex( numOfVert+1 ) botVertIndex( 1 ) botCenterIndex];


writeColorObj( 'HSVCylinder.obj', verts, vertColors, faces );
