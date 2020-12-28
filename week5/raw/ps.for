C    SPECTRUM ANALYSIS PROGRAM BY Y.G.KIM 1990.5.24
C                      MODIFIED BY Lyu Sang Jin
C     THIS PROGRAM IS BLACKMAN & TURKEY METHOD IN TIME SERIES ANALYSIS
C     REF. JENKINS & WATTS
C     LAG WINDOW: BATTLET WINDOW(TURKEY WINDOW)
C
      PARAMETER(IX1=1000000,MLG=100000,LG=100000)
      COMMON/A/X(IX1)
      COMMON/B/COV(LG)
      COMMON/C/PSPEC(MLG)
      COMMON/D/W(LG)
      CHARACTER*50 FMT
c     CHARACTER*30 FCOM
      CHARACTER*12 INFILE,OUTFILE,window,detrend
C
C
      PI=3.141592653
C
C
      open(9,file='ps.con',status='old')
      read(9,*)
      READ(9,'(40x,A12)') INFILE
      READ(9,'(40x,A12)') OUTFILE
      OPEN(11,FILE=INFILE,STATUS='OLD')
      OPEN(13,FILE=OUTFILE)
      OPEN(12,FILE='SPEC.LIS')

C      WRITE(*,'(A\)') ' *;COMMENTS FOR OUTPUT(A20):'
C      READ(*,'(A)') FCOM
C
C     DATA READ IN
C
C     NA; NO.RAW DATA IN EACH SERIES,
C     LAG; NO. OF LAGS IN CORREL. CAL.( LESS THAN LG(101) AND
C          <0.1*NA)
C     NDT; DATA INTERVAL USED IN FILTERING, DT; RAW DATA TIME INTERVAL
C          IF RAW SPEC. IS TAKEN, NDT=1
C     INFILE; INPUT FILE NAME( LESS THAN 15 CHARACTERS)
C     OUTFILE; OUTPUT FILE NAME (LESS THAN 15 CHARACTERS)
C
C
      MMAX=0
      READ(9,'(40x,A30)') FMT
      READ(9,'(40x,i8)') NA
      READ(9,'(40x,i8)') LAG
      READ(9,'(40x,f8.5)') DT
      READ(9,'(40x,f10.5)') SCL
      READ(9,'(40x,i3)') IW
      READ(9,'(40x,i3)') NOCO
      
      READ(11,FMT)(X(I),I=1,NA)
C
C     INITIALIZE COV. AND PSPEC.
C
      DO 9 I=1,LG
    9 COV(I)=0.0
      DO 8 I=1,MLG
    8 PSPEC(I)=0.0
C
C     SCALING THE X(I) VALUES
C
      IF(SCL.EQ.1.0) GO TO 567
      DO 345 I=1,NA
  345 X(I)=SCL*X(I)
  567 CONTINUE
C
      CALL DETRND(NA)
C
C     CALCULATE MEAN AND VARIENCE OF EACH SERIES
C
      X0=0.0
      DO 11 I=1,NA
   11 X0=X0+X(I)
      XM=X0/NA
C
      VAR=0.0
      DO 12 I=1,NA
      X(I)=X(I)-XM
   12 VAR=VAR+X(I)*X(I)
      XVAR=VAR/NA
C
       MA=NA
C
C      WRITE(12,110) FCOM
  110 FORMAT(//,2X,'*** SPECTRAL ANALYSIS OF THE RAW DATA ',/,3X,A30)
      WRITE(12,200) INFILE,XM,XVAR,SCL,MA
  200 FORMAT(//,1X,5X,'STATION = ',A15,//,3X,' DATA MEAN = ',F12.5,3X,
     *'VARIENCE = ',F12.5,/,3X,'MAG. OF X SCALED BY',2X,F10.5,
     *'NO.DATA USED = ',I10)
      
      read(9,'(40x,a12)') detrend
      open(17,file=detrend)
      do i = 1, na
         write(17,'(i5,f15.6)') i, x(i)
      enddo
C
C     CALCULATE THE AUTOCOVARIANCE
C
      DO 13 K=1,LAG
      COZ=0.0
      NK=MA-K
      DO 14 I=1,NK
   14 COZ=COZ+X(I)*X(I+K)
   13 COV(K)=COZ/FLOAT(NA)
      COV(LG)=XVAR
C
      WRITE(12,201) DT
  201 FORMAT(/,3X,'SAMPLE INTERVAL(DT) =',F10.5,1X,'HOUR')
C
C     POWER SPECTRUM
C
      L1=LAG
C
      IF(IW.NE.1) GO TO 333
C
C       HANNING WINDOW (IW=1)
      DO 332 I=1,L1-1
      PIM=(PI*FLOAT(I))/FLOAT(L1)
  332 W(I)=0.5*(1+COS(PIM))
      DGF=(8.*FLOAT(NA))/(3.*FLOAT(L1))
      BW=4./(3.*FLOAT(L1)*DT)
      GO TO 335
  333 CONTINUE
C
C       PARZEN WINDOW (IW=2)
      L2=L1/2
      DO 336 I=1,L2
      TI=FLOAT(I)/FLOAT(L1)
      TD=TI*TI
  336 W(I)=1-6.*TD+6.*TI*TD
      DO 337 I=L2+1,L1-1
      TI=FLOAT(I)/FLOAT(L1)
  337 W(I)=2.*(1.-TI)*(1.-TI)*(1.-TI)
      DGF=(3.71*FLOAT(NA))/FLOAT(L1)
      BW=1.86/(FLOAT(L1)*DT)
  335 CONTINUE
      
      read(9,'(40x,a12)') window
      open(18,file=window)
      DO I=1,L1-1
         write(18,'(f10.2,f10.6)') float(i)*dt,w(i)
      enddo
C
      CALL PSPECT(L1,DT)
C
      XM=FLOAT(NA)
      MDIM=L1
      IF(MMAX.LT.L1) MMAX=L1
C
      WRITE(12,202) DGF,BW,IW,L1
  202 FORMAT(/,3X,'DEGREE OF FREEDOM = ',F10.5,3X,'BANDWIDTH = ',F10.5
     *,/,3X,'KINDS OF WINDOW= ',I5,2X,'NO. OF THE WINDOW-WEIGHT = ',I10)
C
C
C     WRITTING THE COV & POWER SPECTRUM
C
      I0=0
      P0=0.0
C
      IF(NOCO.EQ.2) GO TO 578
      WRITE(13,203)
 203  FORMAT(///,10X,'AUTOCORRELATIONS ',//,2X,'LAGS',10X,'AUTOCOR11')
C
      WRITE(13,2041) I0,COV(LG)
      WRITE(13,204) I0,0.,COV(LG)/cov(LG)
      DO 30 I=1,MMAX
      tt=i*dt
      WRITE(13,204) I,tt,COV(I)/cov(LG)
   30 CONTINUE
  204 FORMAT(I6,F12.5,F14.8)
 2041 FORMAT(I6,5x,F14.8)
C
  578 CONTINUE
C
      WRITE(13,205)
  205 FORMAT(///,10X,'POWER SPECTRUMS ',//,2X,'NO.',3X,'FREQ(cph)',
     *2X,'P-SPECT11',2X,'PERIOD')
C
      WRITE(13,1000) I0,P0,PSPEC(MLG)
 1000 FORMAT(I5,2X,F7.4,8X,F11.5)
      DO 40 I=1,MMAX
      FREQ=FLOAT(I)/(FLOAT(MDIM)*2.0)/dt
      PERI=1./FREQ
   40 WRITE(13,206) I,FREQ,PSPEC(I),PERI
  206 FORMAT(I5,2X,F9.6,F16.6,F12.5)
      STOP
      END
C
C
C
      SUBROUTINE DETRND(N)
      PARAMETER(IX1=1000000)
      COMMON/A/X(IX1)
C
C     DETRENDING BY THE L.S.M
C
      TBAR=FLOAT(N+1)/2.
      ZN=FLOAT(N)
      SMTT=ZN*(ZN*ZN-1.0)/12.0
      SUMX=0.0
      DO 40 I=1,N
   40 SUMX=SUMX+X(I)*(FLOAT(I)-TBAR)
      BETA=Sumx/SMTT
      DO 50 I=1,N
   50 X(I)=X(I)-BETA*(FLOAT(I)-TBAR)
      RETURN
      END
C
C
C
      SUBROUTINE PSPECT(M,DT)
      PARAMETER(MLG=100000,LG=100000)
      COMMON/D/W(LG)
      COMMON/B/COV(LG)
      COMMON/C/PSPEC(MLG)
      M1=M-1
      PI=3.141592653
C
      AV2=0.0
      DO 30 K=1,M1
 30   AV2=AV2+W(K)*COV(K)
C
      CLG=COV(LG)
      DO 20 I=1,M
      F2=(PI*FLOAT(I))/FLOAT(M)
      C=COS(F2)
      V1=0.0
      V0=0.0
      DO 21 K=M1,1,-1
      V2=2.*C*V1-V0+W(K)*COV(K)
      V0=V1
      V1=V2
   21 CONTINUE
   20 PSPEC(I)=2.*DT*(CLG+2.*(V1*C-V0))
      PSPEC(MLG)=2.0*DT*(CLG+2.*AV2)
      RETURN
      END