--[[
    Encrytion API
    For AngeLzOS
]]

local function dump(a)if type(a)=='table'then local b='{ 'for c,d in pairs(a)do if type(c)~='number'then c='"'..c..'"'end;b=b..'['..c..'] = '..dump(d)..','end;return b..'} 'else return tostring(a)end end;local unpack,e,f,g,h,i,j,k,l,m,n=table.unpack or unpack,table.concat,string.byte,string.char,string.rep,string.sub,string.format,math.floor,math.ceil,math.min,math.max;local c,o,p,q,a,r,s,t;function q(b,u)return b*2^u%4294967296 end;function a(b,u)b=b%4294967296/2^u;return b-b%1 end;function r(b,u)b=b%4294967296*2^u;local v=b%4294967296;return v+(b-v)/4294967296 end;function s(b,u)b=b%4294967296/2^u;local v=b%1;return v*4294967296+b-v end;local d={}for w=0,65535 do local b=w%256;local x=(w-b)/256;local y=0;local z=1;while b*x~=0 do local A=b%2;local B=x%2;y=y+A*B*z;b=(b-A)/2;x=(x-B)/2;z=z*2 end;d[w]=y end;local function C(b,x,D)local E=b%4294967296;local F=x%4294967296;local A=E%256;local B=F%256;local y=d[A+B*256]b=E-A;x=(F-B)/256;A=b%65536;B=x%256;y=y+d[A+B]*256;b=(b-A)/256;x=(x-B)/256;A=b%65536+x%256;y=y+d[A]*65536;y=y+d[(b+x-A)/256]*16777216;if D then y=E+F-D*y end;return y end;function c(b,x)return C(b,x)end;function o(b,x)return C(b,x,1)end;function p(b,x,G)if G then x=C(x,G,2)end;return C(b,x,2)end;function t(b)return j("%08x",b%4294967296)end;local H,I,J,K={},{},{},{}local L={[224]={},[256]=K}local M,N={[384]={},[512]=J},{[384]={},[512]=K}local O={}local function P(Q,R,S,T,U,V)for W=U,V+U-1,64 do for X=1,16 do W=W+4;local Y,Z,_,a0=f(S,W-3,W)T[X]=((Y*256+Z)*256+_)*256+a0 end;for X=17,64 do local Y,Z=T[X-15],T[X-2]T[X]=p(s(Y,7),r(Y,14),a(Y,3))+p(r(Z,15),r(Z,13),a(Z,10))+T[X-7]+T[X-16]end;local Y,Z,_,a0,a1,a2,a3,a4,G=Q[1],Q[2],Q[3],Q[4],Q[5],Q[6],Q[7],Q[8]for X=1,64 do G=p(s(a1,6),s(a1,11),r(a1,7))+c(a1,a2)+c(-1-a1,a3)+a4+R[X]+T[X]a4=a3;a3=a2;a2=a1;a1=G+a0;a0=_;_=Z;Z=Y;Y=G+c(a0,_)+c(Y,p(a0,_))+p(s(Y,2),s(Y,13),r(Y,10))end;Q[1],Q[2],Q[3],Q[4]=(Y+Q[1])%4294967296,(Z+Q[2])%4294967296,(_+Q[3])%4294967296,(a0+Q[4])%4294967296;Q[5],Q[6],Q[7],Q[8]=(a1+Q[5])%4294967296,(a2+Q[6])%4294967296,(a3+Q[7])%4294967296,(a4+Q[8])%4294967296 end end;local function a5(a6,a7,a8,a9,S,T,U,V)for W=U,V+U-1,128 do for X=1,32 do W=W+4;local Y,Z,_,a0=f(S,W-3,W)T[X]=((Y*256+Z)*256+_)*256+a0 end;local aa,ab;for ac=17*2,80*2,2 do local ad,ae,af,ag=T[ac-30],T[ac-31],T[ac-4],T[ac-5]aa=p(a(ad,1)+q(ae,31),a(ad,8)+q(ae,24),a(ad,7)+q(ae,25))+p(a(af,19)+q(ag,13),q(af,3)+a(ag,29),a(af,6)+q(ag,26))+T[ac-14]+T[ac-32]ab=aa%4294967296;T[ac-1]=p(a(ae,1)+q(ad,31),a(ae,8)+q(ad,24),a(ae,7))+p(a(ag,19)+q(af,13),q(ag,3)+a(af,29),a(ag,6))+T[ac-15]+T[ac-33]+(aa-ab)/4294967296;T[ac]=ab end;local ad,af,ah,ai,aj,ak,al,am,an=a6[1],a6[2],a6[3],a6[4],a6[5],a6[6],a6[7],a6[8]local ae,ag,ao,ap,aq,ar,as,at,au=a7[1],a7[2],a7[3],a7[4],a7[5],a7[6],a7[7],a7[8]for X=1,80 do local ac=2*X;aa=p(a(aj,14)+q(aq,18),a(aj,18)+q(aq,14),q(aj,23)+a(aq,9))+c(aj,ak)+c(-1-aj,al)+am+a8[X]+T[ac]an=aa%4294967296;au=p(a(aq,14)+q(aj,18),a(aq,18)+q(aj,14),q(aq,23)+a(aj,9))+c(aq,ar)+c(-1-aq,as)+at+a9[X]+T[ac-1]+(aa-an)/4294967296;am=al;at=as;al=ak;as=ar;ak=aj;ar=aq;aa=an+ai;aj=aa%4294967296;aq=au+ap+(aa-aj)/4294967296;ai=ah;ap=ao;ah=af;ao=ag;af=ad;ag=ae;aa=an+c(ai,ah)+c(af,p(ai,ah))+p(a(af,28)+q(ag,4),q(af,30)+a(ag,2),q(af,25)+a(ag,7))ad=aa%4294967296;ae=au+c(ap,ao)+c(ag,p(ap,ao))+p(a(ag,28)+q(af,4),q(ag,30)+a(af,2),q(ag,25)+a(af,7))+(aa-ad)/4294967296 end;aa=a6[1]+ad;ab=aa%4294967296;a6[1],a7[1]=ab,(a7[1]+ae+(aa-ab)/4294967296)%4294967296;aa=a6[2]+af;ab=aa%4294967296;a6[2],a7[2]=ab,(a7[2]+ag+(aa-ab)/4294967296)%4294967296;aa=a6[3]+ah;ab=aa%4294967296;a6[3],a7[3]=ab,(a7[3]+ao+(aa-ab)/4294967296)%4294967296;aa=a6[4]+ai;ab=aa%4294967296;a6[4],a7[4]=ab,(a7[4]+ap+(aa-ab)/4294967296)%4294967296;aa=a6[5]+aj;ab=aa%4294967296;a6[5],a7[5]=ab,(a7[5]+aq+(aa-ab)/4294967296)%4294967296;aa=a6[6]+ak;ab=aa%4294967296;a6[6],a7[6]=ab,(a7[6]+ar+(aa-ab)/4294967296)%4294967296;aa=a6[7]+al;ab=aa%4294967296;a6[7],a7[7]=ab,(a7[7]+as+(aa-ab)/4294967296)%4294967296;aa=a6[8]+am;ab=aa%4294967296;a6[8],a7[8]=ab,(a7[8]+at+(aa-ab)/4294967296)%4294967296 end end;do local function av(aw,ax,ay,az)local aA={}local aB=0;local aC=0.0;local aD=1.0;for X=1,az do local aE=0;for aF=n(1,X+1-#ax),m(X,#aw)do aE=aE+aw[aF]*ax[X+1-aF]end;aB=aB+aE*ay;local aG=aB%16777216;aA[X]=aG;aB=k(aB/16777216)aC=aC+aG*aD;aD=aD*2^24 end;return aA,aC end;local w,aH,aI,aJ=0,{4,1,2,-2,2},4,{1}local aK,aL,aM=K,J,0;repeat aI=aI+aH[aI%6]local a0=1;repeat a0=a0+aH[a0%6]if a0*a0>aI then w=w+1;local aN=aI^(1/3)local aO=av({k(aN*2^40)},aJ,1,2)local aP,aQ=av(aO,av(aO,aO,1,4),-1,4)local aR=aO[2]%65536*65536+k(aO[1]/256)local aS=aO[1]%256*16777216+k(aQ*2^-56/3*aN/aI)I[w],H[w]=aR,aS;if w<17 then aN=aI^(1/2)aO=av({k(aN*2^40)},aJ,1,2)aP,aQ=av(aO,aO,-1,2)aR=aO[2]%65536*65536+k(aO[1]/256)aS=aO[1]%256*16777216+k(aQ*2^-17/aN)L[224][w+aM]=aS;aK[w+aM],aL[w+aM]=aR,aS;if w==8 then aK,aL,aM=N[384],M[384],-8 end end;break end until aI%a0==0 until w>79 end;for aT=224,256,32 do local a6,a7={},{}for X=1,8 do a6[X]=p(J[X],0xa5a5a5a5)a7[X]=p(K[X],0xa5a5a5a5)end;a5(a6,a7,H,I,"SHA-512/"..tonumber(aT).."\128"..h("\0",115).."\88",O,0,128)M[aT]=a6;N[aT]=a7 end;local function aU(aT,aV)local Q,aW,aX={unpack(L[aT])},0,""local function aY(aZ)if aZ then if aX then aW=aW+#aZ;local U=0;if aX~=""and#aX+#aZ>=64 then U=64-#aX;P(Q,I,aX..i(aZ,1,U),O,0,64)aX=""end;local V=#aZ-U;local a_=V%64;P(Q,I,aZ,O,U,V-a_)aX=aX..i(aZ,#aZ+1-a_)return aY else error("Adding more chunks is not allowed after asking for final result",2)end else if aX then local b0={aX,"\128",h("\0",(-9-aW)%64+1)}aX=nil;aW=aW*8/256^7;for X=4,10 do aW=aW%1*256;b0[X]=g(k(aW))end;b0=e(b0)P(Q,I,b0,O,0,#b0)local b1=aT/32;for X=1,b1 do Q[X]=t(Q[X])end;Q=e(Q,"",1,b1)end;return Q end end;if aV then return aY(aV)()else return aY end end;local function b2(aT,aV)local aW,aX,a6,a7=0,"",{unpack(M[aT])},{unpack(N[aT])}local function aY(aZ)if aZ then if aX then aW=aW+#aZ;local U=0;if aX~=""and#aX+#aZ>=128 then U=128-#aX;a5(a6,a7,H,I,aX..i(aZ,1,U),O,0,128)aX=""end;local V=#aZ-U;local a_=V%128;a5(a6,a7,H,I,aZ,O,U,V-a_)aX=aX..i(aZ,#aZ+1-a_)return aY else error("Adding more chunks is not allowed after asking for final result",2)end else if aX then local b0={aX,"\128",h("\0",(-17-aW)%128+9)}aX=nil;aW=aW*8/256^7;for X=4,10 do aW=aW%1*256;b0[X]=g(k(aW))end;b0=e(b0)a5(a6,a7,H,I,b0,O,0,#b0)local b1=l(aT/64)for X=1,b1 do a6[X]=t(a7[X])..t(a6[X])end;a7=nil;a6=e(a6,"",1,b1):sub(1,aT/4)end;return a6 end end;if aV then return aY(aV)()else return aY end end;sha224=function(aV)return aU(224,aV)end;sha256=function(aV)return aU(256,aV)end;sha384=function(aV)return b2(384,aV)end;sha512=function(aV)return b2(512,aV)end;sha512_224=function(aV)return b2(224,aV)end;sha512_256=function(aV)return b2(256,aV)end