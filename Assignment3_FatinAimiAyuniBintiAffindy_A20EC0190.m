% Assignment 3 Music Generation
% Name: Fatin Aimi Ayuni Binti Affindy
% Matric: A20EC0190
% Section: 02
% Song: Twinkle Twinkle Little Star

C = 261.63;
G = 392.00;
A = 440.00;
F = 349.23;
E = 329.63;
D = 293.66;

freq = [C C G G A A G F F E E D D C G G F F E E D G G F F E E D C C G G A A G F F E E D D C];
dur = [0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.8, 0.4, 0.4, 0.4, 0.4, 0.4, 0.8, 0.4, 0.4, 0.4, 0.4, 0.4, 0.8, 0.4, 0.4, 0.4, 0.4, 0.4, 0.8, 0.4, 0.4, 0.4, 0.4, 0.4, 0.8, 0.4, 0.4, 0.4, 0.4, 0.4, 0.8, 0.4, 0.4, 0.4, 0.4, 0.4, 0.8];

dur = dur-0.15;
for i=1:42
     tone = note(freq(i),dur(i),16000);
     pause(0.3);
     soundsc(tone,16000)
end

tone = note(freq(1),dur(1),16000);
soundsc(tone,16000);

function tone = note(freq, dur, fs)
t =0:1/fs:dur;
 
x = t/dur;
envelope =x.*(1-x).*(exp(-8*x)+0.5*x.*(1-x));
 
beat = 0.08;
 
harmonic0=sin(2*pi*freq*t*(1-beat))+sin(2*pi*freq*t*(1+beat));
harmonic1=sin(2*pi*2*freq*t*(1-beat))+sin(2*pi*2*freq*t*(1+beat));
harmonic2=sin(2*pi*3*freq*t*(1-beat))+sin(2*pi*3*freq*t*(1+beat));
 
tone = envelope.*(harmonic0+0.2*harmonic1+0.05*harmonic2);
 
 
tone = tone/max(tone);
end