$TITLE CAL 2 : MODELE 1
$STITLE ECONOMIE OUVERT AVEC GOUVERNEMENT

*******************projet de these (monétaire avec urbains/ruraux) 2014**********************************

*******************MODELE ELABORE PAR :
*********** ******MOUGNOL A EKOULA HERVE WILLIAM ******************
****************************ET***************************************
**********************LES MEMBRES DU LAREM**********************************
********************CALAGE

 SET I SECTORS / AGR AGRICULTURES
                 IND INDUSTRIES
                 SER SERVICES
                 SERNM SERVICES NON MARCHAND /

   AS(I)          / AGR AGRICULTURES
                    SER SERVICES
                    SERNM SERVICES NON MARCHAND/

  NAGR(I)        / IND INDUSTRIES
                   SER SERVICES /


  SERV(I)        / SER   SERVICES
                   SERNM SERVICES NON MARCHAND/

  MAR(I)         / AGR   AGRICULTURES
                   IND   INDUSTRIES
                   SER   SERVICES/

  BIEN(I)        / AGR AGRICULTURES
                   IND INDUSTRIES/

  SNM(I)         / SERNM SERVICES NON MARCHAND /

 SET H HOUSEHOLDS / H1 MENAGES  URBAINS
                    H2 MENAGES RURAUX /

 ALIAS (I,J)
 ALIAS (MAR, MARJ)

*******************PARAMETRES DU MODELES**************************************

PARAMETER

 A(I)            COEFFICIENTS D'ECHELLE DE LA COBB-DOUGLAS
 alpha(I)        ELASTICITES DE LA COBB-DOUGLAS (PART EN VALEUR)
 io(I)           COEFFICIENT DE LA LEONTIEFF CIT
 vi(I)           COEFFICIENT DE LA LEONTIEFF VA
 aij(I,J)        COEFFICIENT INPUT-OUTPUT
 beta_c(H,I)     PART DU BIEN I DANS LA CONSOMMATION TOTALE DU MENAGE H (PART EN VALEUR)
 beta_g(I)       PART DU BIEN I DANS LA CONSOMMATION TOTALE DE L'ETAT (PART EN VALEUR)
 pme(H)          PROPENSION A EPARGNER (PART EN VALEUR)
 beta_i(I)       PART DU BIEN I DANS L'INVESTISSEMENT TOTAL (PART EN VALEUR)
 lambda_k        PART DE LA REMUNERATION DU CAPITAL AU MENAGE DETENTEUR DE CAPITAL
 lambda_kw       PART DE LA REMUNERATION DU CAPITAL AU RESTE DU MONDE
 txo(I)          TAUX DE TAXES PERCUES SUR LES PRODUITS
 tym(H)          TAUX D'IMPOSITION SUR LE REVENU DES MENAGES
 tyeo            TAUX D'IMPOSITION SUR LE REVENU DES ENTREPRISES
 tmo(I)          TAUX DU DROIT DE DOUANE A L'IMPORTATION DU PRODUIT I
 te(I)           TARIF A L'EXPORTATION
 B_T(I)          PARAMETRE D'ECHELLE DE LA CET
 B_S(I)          PARAMETRE D'ECHELLE DE LA CES
 rho_t(I)        PARAMETRE DE TRANSFORMATION DE LA CET
 delta_t(I)      PARAMETRE DE POIDS DE LA CET
 sigma_t(I)      ELASTICITE DE TRANSFORMATION DE LA CET
 rho_s(I)        PARAMETRE DE SUBSTITUTION DE LA CES
 delta_s(I)      PARAMETRE DE POIDS DE LA CES
 sigma_s(I)      ELASTICITE DE SUBSTITUTION DE LA CES
 BETA_V(I)       BRANCH I'S SHARE IN TOTAL PRODUCTION

********************PRIX****************************

 PINDEXO         INDICE DES PRIX A LA PRODUCTION (GDP DEFLATOR)
 SO              TAUX DE SALAIRE
 RO(I)           REMUNERATION DU CAPITAL PAR BRANCHE D'ACTIVITE
 PO(I)           PRIX A LA PRODUCTION DU BIEN I
 PVAO(I)         PRIX DE LA VALEUR AJOUTEE DU BIEN I
 PDO(I)          PRIX DOMESTIQUE DU BIEN I
 PQO(I)          PRIX DU BIEN COMPOSITE I
 PMO(I)          PRIX INTERIEUR DU BIEN IMPORTE I
 PEO(I)          PRIX INTERIEUR DU BIEN EXPORTE I
 PWMO(I)         PRIX MONDIAL DU BIEN IMPORTE I EN DEVISE ETRANGERE
 PWEO(I)         PRIX MONDIAL DU BIEN EXPORTE I EN DEVISE ETRANGERE
 PI(I)           prix
 EO                TAUX DE CHANGE

*****************PRODUCTION****************************

 XSO(I)          PRODUCTION DE LA BRANCHE I (VOLUME)
 VAO(I)          VALEUR AJOUTEE DE LA BRANCHE I (VOLUME)
 CIJO(I,J)       CONSOMMATION INTERMEDIAIRE DU BIEN I PAR LA BRANCHE J (VOLUME)
 CITO(I)         CONSOMMATION INTERMEDIAIRE TOTALE DE LA BRANCHE I (VOLUME)

********************FACTEURS*********************************

 KDO(I)          DEMANDE DE CAPITAL PAR BRANCHES (VOLUME)
 LSO             OFFRE DE MAIN D'OEUVRE (VOLUME)
 LDO(I)          DEMANDE DE MAIN D'OEUVRE PAR BRANCHES (VOLUME)

**********************DEMANDES

 CO(I)           CONSOMMATION DU BIEN I (VOLUME)
 CMO(H,I)        CONSOMMATION DU BIEN I PAR LE MENAGE H (VOLUME)
 CGO(I)          CONSOMMATION DU BIEN I PAR L'ETAT (VOLUME)
 CGTO            CONSOMMATION TOTALE DE L'ETAT (VALEUR)
 INVO(I)         INVESTISSEMENT DU BIEN I (VOLUME)
 ITO             INVESTISSEMENT TOTAL (VALEUR)
 DINTO(I)        DEMANDE INTERMEDIAIRE DE LA BRANCHE I (VOLUME)
 DO(I)           DEMANDE DU BIEN DOMESTIQUE I
 QO(I)           DEMANDE COMPOSITE DE D(I) ET M(I)

****************COMMERCE EXTERIEUR***************************

 MO(I)  IMPORTATIONS CAF (VOL)
 EXO(I) EXPORTATIONS (VOL)
 BACO   BALANCE DU COMPTE COURANT

******************REVENUES ET EPARGNES************************

 YMO(H)  REVENU DU MENAGE H
 YDMO(H) REVENU DISPONIBLE DU MENAGE H
 YEO     REVENU DES ENTREPRISES
 YGO     REVENU DU GOUVERNEMENT
 EMO(H)  EPARGNE DES MENAGES
 EEO     EPARGNE DES ENTREPRISES
 EGO     EPARGNE DU GOUVERNEMENT
 TEMO    TRANSFERT DES ENTREPRISES VERS LES MENAGES CAPITALISTIQUES
 TGMO    TRANSFERT DE L'ETAT VERS LES MENAGES DETENTEURS DE MAIN D'OEUVRE
 TEWO    TRANSFERT DES FIRMES VERS LE RESTE DU MONDE
 TXSO(I) TAXES PERCUES SUR LES PRODUITS
 TXMO(I)  DROITS PERCUES SUR LES IMPORTS
 TXEO(I)  DROITS PERCUES SUR LES EXPORTS
 TXYMO(H) IMPOTS PERCUS SUR LE REVENU DES MENAGES
 TXYEO    IMPOTS PERCUS SUR LE REVENU DES ENTREPRISES
 PD1(I)
 ;

****************DONNEE EN VALEUR

 TABLE CIJO(I,J)
       AGR     IND        SER      SERNM
 AGR   162140  958307     160286   1581
 IND   250979  2195458    1210572  399901
 SER   113367  424271     754624   316568
;

 TABLE DP(*,I)
              AGR        IND           SER       SERNM
 XSO          2072160    5916014       4226515   1086435
 VAO          1545674    2337977.7     2101033   368385
 LDO          216289     495355        1033450   358083
 KDO          62914      1293269       1067583   10302
 EXO          121085     1781757       324237
 DO           2615757    8401679.248   5027980   914193
 MO           121085     1781757       324237
 QO           2090016    5871374       6579637   1838450
 INVO         8503       2229633       3177      92142
 TXSO         29317      559443        136241    1979
 TXMO         3272       23240         10940
 TXEO
 CGO                                             63855
 sigma_s      2.0        0.6           0.2
 sigma_t      1.5        0.5            1.0
 ;


 TABLE CMO(H,I)

        AGR                IND              SER             SERNM
 H1     576735.2775        1682830.884      1143296.068     444300.8063
 H2     750296.7225        1305770.116      980531.9317     301113.1937

;

 TABLE MENAGE(*,H)

        H1            H2
 YMO    4768200.802   3015484.196
 EMO    3847163.146   3337711.964
 TXYMO  78292.29651   32288.70349

;

 SCALAR

 TEMO / 11840.50765 /
 TGMO / 115106.0103 /
 TXYEO / 460680 /
 TEWO / 250627 /
 YEO / 2037730 /
 YGO / 1867135/
 EEO / 1234572 /
 EGO / 925345 /
 ITO / 136478661.1 /

 lambda_k   / 11100.0/
 lambda_kw   / 925.0/
 ;

**************CALCULS

 XSO(I) = DP("XSO",I) ;
 VAO(I) = DP("VAO",I) ;
 LDO(I) = DP("LDO",I) ;
 KDO(I) = DP("KDO",I) ;
 EXO(I) = DP("EXO",I) ;
 DO(I) = DP("DO",I) ;
 MO(I) = DP("MO",I) ;
 QO(I) = DP("QO",I) ;
 INVO(I) = DP("INVO",I) ;
 TXSO(I) = DP("TXSO",I) ;
 TXMO(I) = DP("TXMO",I) ;
 TXEO(I) = DP("TXEO",I) ;
 CGO(I) = DP("CGO",I) ;
 sigma_s(I) = DP("sigma_s",I) ;
 sigma_t(I) = DP("sigma_t",I) ;
 YMO(H) = MENAGE("YMO",H) ;
 EMO(H) = MENAGE("EMO",H) ;
 TXYMO(H) = MENAGE("TXYMO",H);


**********************Taux des taxes

 txo(I) = TXSO(I)/(DO(I)+MO(I)+TXMO(I));
 tym(H) = TXYMO(H)/YMO(H) ;
 tyeo = TXYEO/YEO ;
 tmo(MAR) = TXMO(MAR)/MO(MAR);
 te(MAR) = TXEO(MAR)/EXO(MAR);

***********************Prix
 SO = 1.00 ;
 RO(I) = 1.00 ;
 PO(I) = 1.00 ;
 PWMO(I) = 1.00 ;
 PEO(I) = 1.00 ;
 EO = 1.00 ;

*PDO(I) = (1+txo(I))*PO(I) ;
 PDO(I) =( (1+txo(I))*(PO(I)*XSO(I) - EXO(I)*PEO(I)) )/DO(I) ;

 PMO(I) = PWMO(I)*(1+txo(I))*(1+tmo(I))*EO;
 PWEO(I) = PEO(I)*EO*(1+te(I)+198.68);
 PQO(I) = ( PDO(I)*DO(I) + PMO(I)*MO(I) )/QO(I) ;


***************CALCUL DES VOLUMES

 LDO(I) = LDO(I)/SO ;
 KDO(I) = KDO(I)/RO(I) ;
 XSO(I) = XSO(I)/PO(I) ;
 CIJO(I,J) = CIJO(I,J)/PQO(I) ;
 CMO(H,I) = CMO(H,I)/PQO(I) ;
 CGO(I) = CGO(I)/PQO(I) ;
 INVO(I) = INVO(I)/PQO(I) ;

 DINTO(I) = SUM(J,CIJO(I,J)) ;
 CITO(J) = SUM(I,CIJO(I,J)) ;
 LSO = SUM(I,LDO(I)) ;
 CO(I) = SUM(H,CMO(H,I))+CGO(I) ;
 CGTO = SUM(I, PDO(I)*CGO(I)) ;
 YDMO(H) = YMO(H) - TXYMO(H) ;
 EXO(I) = EXO(I)/PEO(I) ;


***********CALCUL DES PRIX

 PVAO(I) = ( PO(I)*XSO(I) - SUM(J,PQO(J)*CIJO(J,I)) )/VAO(I) ;


**********CALAGE DES PARAMETRES

**********CONSOMMATIONS ET EPARGNES

 beta_c(H,I) = (PQO(I)*CMO(H,I))/YDMO(H) ;
 beta_g(I) = (PQO(I)*CGO(I))/CGTO ;
 pme(H) = EMO(H)/YDMO(H) ;
 beta_i(I) = (PQO(I)*INVO(I))/ITO ;
 aij(I,J) = CIJO(I,J)/CITO(J) ;
 lambda_k = lambda_k/SUM(I,RO(I)*KDO(I)) ;
 lambda_kw = lambda_kw/SUM(I,RO(I)*KDO(I)) ;

************PRODUCTIONS

 alpha(I) = SO*LDO(I)/(PVAO(I)*VAO(I)) ;
 A(MAR) = VAO(MAR)/((LDO(MAR)**alpha(MAR))*(KDO(MAR)**(1-alpha(MAR))) ) ;
 A(SNM) = VAO(SNM)/(LDO(SNM)**alpha(SNM)) ;
 io(I) = CITO(I)/XSO(I) ;
 vi(I) = VAO(I)/XSO(I) ;

***********COMMERCE EXTERIEUR

**************************CET********************************

 rho_t(MAR) = (1+sigma_t(MAR))/sigma_t(MAR);
 delta_t(MAR) = 1/(1+(PDO(MAR)/(1+txo(MAR)))/PEO(MAR)*(EXO(MAR)/DO(MAR))**(rho_t(MAR)-1));
 B_T(MAR) = XSO(MAR)/(delta_t(MAR)*EXO(MAR)**rho_t(MAR)+(1-delta_t(MAR))*DO(MAR)**rho_t(MAR))**(1/rho_t(MAR));

************************CES********************************************

 rho_s(MAR) = (1-sigma_s(MAR))/sigma_s(MAR);
 delta_s(MAR) = (PMO(MAR)/PDO(MAR))*(MO(MAR)/DO(MAR))**(1/sigma_s(MAR));
 delta_s(MAR) = delta_s(MAR)/(1+delta_s(MAR));
 B_S(MAR) = QO(MAR)/(delta_s(MAR)*MO(MAR)**(-rho_s(MAR))+(1-delta_s(MAR))*DO(MAR)**(-rho_s(MAR)))**(-1/rho_s(MAR));

 BACO = SUM(I,PWMO(I)*MO(I)) +lambda_kw*Sum(I,RO(I)*KDO(I)) + ( (1/EO)*TEWO ) - SUM(I,(PWEO(I)*EXO(I)));

 BETA_V(I) = PVAO(I)*VAO(I)/SUM(J,PVAO(J)*VAO(J));
 PINDEXO = SUM(I,PVAO(I)*BETA_V(I));
 PO(MAR) = (( (PDO(MAR)*DO(MAR))/(1+TXO(MAR))) + (PEO(MAR)*EXO(MAR)) ) /XSO(MAR);


 DISPLAY PDO,PO,PEO,PWEO,TE,BACO,EXO,pindexo,eo,mo,qo,sigma_t,rho_t,delta_t,b_t,sigma_s,rho_s,delta_s,b_s;

*FIN DU CALAGE


********************LE MODELE**********************

************** DEFINITION DES VARIABLES**********************

 VARIABLES

************************PRIX**********************************
 S TAUX DE SALAIRE
 R(I) REMUNERATION DU CAPITAL PAR BRANCHE D'ACTIVITE
 P(I) PRIX A LA PRODUCTION DU BIEN I
 PVA(I) PRIX DE LA VALEUR AJOUTEE DU BIEN I
 PD(I) PRIX DOMESTIQUE DU BIEN I
 PQ(I) PRIX DU BIEN COMPOSITE I
 PM(I) PRIX INTERIEUR DU BIEN IMPORTE I
 PE(I) PRIX INTERIEUR DU BIEN EXPORTE I
 PWM(I) PRIX MONDIAL DU BIEN IMPORTE I EN DEVISE ETRANGERE
 PWE(I) PRIX MONDIAL DU BIEN EXPORTE I EN DEVISE ETRANGERE
 E TAUX DE CHANGE

**********************PRODUCTION********************************************

 XS(I) PRODUCTION DE LA BRANCHE I (VOLUME)
 VA(I) VALEUR AJOUTEE DE LA BRANCHE I (VOLUME)
 CIJ(I,J) CONSOMMATION INTERMEDIAIRE DU BIEN I PAR LA BRANCHE J (VOLUME)
 CIT(I) CONSOMMATION INTERMEDIAIRE TOTALE DE LA BRANCHE I (VOLUME)

***********************FACTEURS*******************************************

 KD(I) DEMANDE DE CAPITAL PAR BRANCHES (VOLUME)
 LS OFFRE DE MAIN D'OEUVRE (VOLUME)
 LD(I) DEMANDE DE MAIN D'OEUVRE PAR BRANCHES (VOLUME)

**********************DEMANDES********************************************

 C(I) CONSOMMATION DU BIEN I (VOLUME)
 CM(H,I) CONSOMMATION DU BIEN I PAR LE MENAGE H (VOLUME)
 CG(I) CONSOMMATION DU BIEN I PAR L'ETAT
 CGT CONSOMMATION TOTALE DE L'ETAT
 INV(I) INVESTISSEMENT DU BIEN I (VOLUME)
 IT INVESTISSEMENT TOTAL (VALEUR)
 DINT(I) DEMANDE INTERMEDIAIRE DE LA BRANCHE I (VOLUME)
 D(I) DEMANDE DU BIEN DOMESTIQUE I
 Q(I) DEMANDE COMPOSITE DE D(I) ET M(I)

*******************COMMERCE EXTERIEUR************************************

 M(I) IMPORTATIONS CAF (VOL)
 EX(I) EXPORTATIONS (VOL)
 BAC BALANCE DU COMPTE COURANT

*******************REVENUES ET EPARGNES***********************************

 YM(H) REVENU DU MENAGE H
 YDM(H) REVENU DISPONIBLE DU MENAGE H
 YE REVENU DES ENTREPRISES
 YG REVENU DU GOUVERNEMENT
 EM(H) EPARGNE DES MENAGES
 EE EPARGNE DES ENTREPRISES
 EG EPARGNE DU GOUVERNEMENT
 TEM TRANSFERT DES ENTREPRISES VERS LES MENAGES CAPITALISTIQUES
 TGM TRANSFERT DE L'ETAT VERS LES MENAGES DETENTEURS DE MAIN D'OEUVRE
 TEW TRANSFERT DES FIRMES VERS LE RESTE DU MONDE
 TXS(I) TAXES PERCUES SUR LES PRODUITS
 TXM(I) DROITS DE DOUANE PERCUES
 TXE(I) DROITS PERCUES SUR LES EXPORTATIONS
 tye TAXES DIRECTES SUR LES IMPOTS
 TX(I) TAUX DE TAXES PERCUES SUR LES PRODUITS
 TM(I) TAUX DE TAXES PERCUES SUR LES IMPORTS
 TXYM(H) IMPOTS PERCUS SUR LE REVENU DES MENAGES
 TXYE IMPOTS PERCUS SUR LE REVENU DES ENTREPRISES
 PINDEX PRODUCER PRICE INDEX

***********************EQUILIBRE*********************************

 LEON VARIABLE DE L'EQUATION DE WALRAS

 OMEGA VARIABLE D'OPTIMISATION
 ;

 EQUATIONS

 OFFRE(I) PRODUCTION DE LA BRANCHE I
 VAJ1(MAR) VALEUR AJOUTEE DES BRANCHES MARCHANDS
 VAJ2(SNM) VALEUR AJOUTEE DE LA BRANCHE SERVICE NON MARCHAND
 CITEQ(I) CONSOMMATION INTERMEDIAIRE TOTALE
 CIJEQ(I,J) CONSOMMATION INTERMEDIAIRE DU BIEN I PAR LA BRANCHE J (VOLUME)
 LDEM1(I) DEMANDE DE MAIN D'OEUVRE PAR LES BRANCHES MARCHANDES(VOLUME)
 LDEM2 DEMANDE DE MAIN D'OEUVRE DE LA BRANCHES DE SERVICES NON-MARCHAND (VOLUME)

************************REVENUE*************************************

 REVM1 REVENU DU MENAGE DETENTEUR DE MAIN D'OEUVRE
 REVM2 REVENU DU MENAGE DETENTEUR DE CAPITAL
 REVDM(H) REVENU DISPONIBLE DU MENAGE H
 REVE REVENU DES ENTREPRISES
 REVG REVENU DE L'ETAT
 EPGM(H) EPARGNE DES MENAGES
 EPGE EPARGNE DES ENTREPRISES
 EPGG EPARGNE DE L'ETAT

***********************TAXES*****************************************

 TAXES(I) TAXES SUR LE BIEN I
 TXEM(MAR) DROITS DE DOUANE PERCUS
 TXEE(MAR) TAXES A L'EXPORTATION
 IMPOTM(H) IMPOTS SUR LE REVENU DU MENAGE H
 IMPOTE IMPOTS SUR LE REVENU DE L'ENTREPRISE

******************************DEMANDE***************************************

 CONS(I) CONSOMMATION DU BIEN I (VOLUME)
 CONSM(H,I) CONSOMMATION DU BIEN I PAR LE MENAGE H (VOLUME)
 CONSG(I) CONSOMMATION DU BIEN I PAR L'ETAT (VOLUME)
 INVESB(I) INVESTISSEMENT DU BIEN I (VOLUME)
 DEMINT(I) DEMANDE INTERMEDIAIRE DE LA BRANCHE I (VOLUME)

******************************PRIX***************************************

 PRVA1(I) PRIX DE LA VALEUR AJOUTEE
 PRVA2 PRIX DE LA VALEUR AJOUTEE
 RETK(I) REMUNERATION DU CAPITAL PAR BRANCHE D'ACTIVITE
* PRIXC(I) PRIX A LA CONSOMMATION DU BIEN DOMESTIQUE I
 PRIXM(I) PRIX DU BIEN IMPORTE I
 PRIXE(I) PRIX DU BIEN EXPORTE I
 PRIXC1(I) PRIX A LA CONSOMMATION DU BIEN COMPOSITE MARCHAND
 PRIXC2(I) PRIX A LA CONSOMMATION DU BIEN COMPOSITE NON-MARCHAND
 PROPR1(I) PRIX A LA PRODUCTION DU BIEN MARCHAND
 PROPR2(I) PRIX A LA PRODUCTION DU BIEN NON-MARCHAND

****************************COMMERCE EXTERIEUR******************************

 CET(MAR) LIEN (CET) ENTRE EX ET D
 XSEQ LIEN ENTRE CONSOMMATION ET PRODUCTION DU SERVICE NON-MARCHAND
 QEQ
 EXPORT(MAR) OFFRE D'EXPORTATION DU BIEN MARCHAND
 ARMING(MAR) HYPOTHESE D'ARMINGTON CONCERNANT LE BIEN COMPOSITE MARCHAND
 IMPORT(MAR) DEMANDE D'IMPORTATION DES BIENS MARCHAND
 BALCOUR BALANCE COURANTE DU RESTE DU MONDE

*****************************EQUILIBRE**************************************

 ABSDOM1(BIEN) ABSORPTION DOMESTIQUE DES BIENS
 ABSDOM2 ABSORPTION DOMESTIQUE DES BIENS
 LOFFRE OFFRE DE MAIN D'OEUVRE (VOLUME)
 INVEST INVESTISSEMENT TOTAL (VALEUR)
 AVPRI PRODUCER PRICE INDEX
 OBJ FONCTION OBJECTIVE
 WALRAS EQUATION DE WALRAS
 ;

*****MODELE

***********PRODUCTION ET EMPLOI

 OFFRE(I).. XS(I) =E= CIT(I)/io(I);

 VAJ1(MAR).. VA(MAR) =E= A(MAR)*((LD(MAR)**alpha(MAR))*KD(MAR)**(1-alpha(MAR)) );

 VAJ2(SNM).. VA(SNM) =E= LD(SNM);

 CITEQ(I).. CIT(I) =E= io(I)*VA(I)/vi(I) ;

 CIJEQ(MAR,J).. CIJ(MAR,J) =E= aij(MAR,J)*CIT(J);

 LDEM1(MAR).. LD(MAR) =E= PVA(MAR)*alpha(MAR)*VA(MAR)/S;

 LDEM2.. LD("SERNM") =E= ( P("SERNM")*XS("SERNM")- SUM(MARJ,CIJ(MARJ,"SERNM")*PQ(MARJ)) )/S;


*********REVENUS ET EPARGNE



 REVM1.. YM("H1") =E= S*SUM(I,LD(I)) + TGM ;

 REVM2.. YM("H2") =E= lambda_k*SUM(MAR,R(MAR)*KD(MAR)) + TEM ;

 REVDM(H).. YDM(H) =E= YM(H) - TXYM(H) ;

 REVE.. YE =E= (1-lambda_k-lambda_kw)*SUM(MAR,R(MAR)*KD(MAR)) ;

 REVG.. YG =E= SUM(MAR,TXS(MAR)) + SUM(H,TXYM(H))+ SUM(MAR,TXE(MAR)) + SUM(MAR,TXM(MAR)) + TXYE ;

 EPGM(H).. EM(H) =E= pme(H)*YDM(H) ;

 EPGE.. EE =E= YE - TEM - TXYE -TEW ;

 EPGG.. EG =E= YG - CGT - TGM ;

**********TAXES


 TAXES(MAR).. TXS(MAR) =E= tx(MAR)*(P(MAR)* XS(MAR)-PE(MAR)*EX(MAR)) + tx(MAR)*(1+tm(MAR))*E*PWM(MAR)*M(MAR) ;

 TXEM(MAR).. TXM(MAR) =E= tm(MAR)*PWM(MAR)*E*M(MAR);

 TXEE(MAR).. TXE(MAR) =E= te(MAR)*PE(MAR)*EX(MAR);

 IMPOTM(H).. TXYM(H) =E= tym(H)*YM(H) ;

 IMPOTE.. TXYE =E= tye*YE ;

 AVPRI.. PINDEX =E= SUM(I,PVA(I)*BETA_V(I));

*********DEMANDE

 CONS(I).. C(I) =E= SUM(H,CM(H,I)) + CG(I) ;

 CONSM(H,I).. CM(H,I) =E= beta_c(H,I)*YDM(H)/PQ(I) ;

 CONSG(I).. CG(I) =E= beta_g(I)*CGT/PQ(I) ;

 DEMINT(MAR).. DINT(MAR) =E= SUM(J, aij(MAR,J)*CIT(J)) ;

 INVESB(BIEN).. INV(BIEN) =E= BETA_I(BIEN)*IT/PQ(BIEN) ;


**************PRIX

 PRVA1(MAR).. PVA(MAR) =E= ( P(MAR)*XS(MAR)-SUM(MARJ,CIJ(MARJ,MAR)*PQ(MARJ)) )/VA(MAR);

 PRVA2.. PVA("SERNM") =E= S ;

 RETK(MAR).. R(MAR) =E= ( PVA(MAR)*VA(MAR) - S*LD(MAR) )/KD(MAR) ;

 PRIXM(MAR).. PM(MAR) =E= (1+TX(MAR))*(1+TM(MAR))*E*PWM(MAR);

 PRIXE(MAR).. PE(MAR) =E= PWE(MAR)*E/(1+te(MAR));

 PRIXC1(MAR).. PQ(MAR) =E= (PD(MAR)*D(MAR)+PM(MAR)*M(MAR))/Q(MAR);

 PRIXC2(SNM).. PQ(SNM) =E= PD(SNM);

 PROPR1(MAR).. XS(MAR)*P(MAR) =E= ( (PD(MAR)*D(MAR))/(1+TX(MAR))) + (PE(MAR)*EX(MAR));

 PROPR2(SNM).. P(SNM) =E= PD(SNM);

**********COMMERCE EXTERIEUR

 CET(MAR).. XS(MAR) =E= B_T(MAR)*(delta_t(MAR)*EX(MAR)**rho_t(MAR)+(1-delta_t(MAR))*D(MAR)**rho_t(MAR))**(1/rho_t(MAR));

 XSEQ.. XS("SERNM") =E= D("SERNM");

 QEQ.. Q("SERNM") =E= D("SERNM");

 EXPORT(MAR).. EX(MAR) =E= ((PE(MAR)/(PD(MAR)/(1+TX(MAR))))**sigma_t(MAR)*((1-delta_t(MAR))/delta_t(MAR))**sigma_t(MAR))*D(MAR);

 ARMING(MAR).. Q(MAR) =E= B_S(MAR)*(delta_s(MAR)*M(MAR)**(-rho_s(MAR))+(1-delta_s(MAR))*D(MAR)**(-rho_s(MAR)))**(-1/rho_s(MAR));

 IMPORT(MAR).. M(MAR) =E= ((delta_s(MAR)/(1-delta_s(MAR)))**(sigma_s(MAR))*(PD(MAR)/PM(MAR))**sigma_s(MAR))*D(MAR);

 BALCOUR.. BAC =E= SUM(MAR,PWM(MAR)*M(MAR))+(1/E)*lambda_kw*SUM(MAR, R(MAR)*KD(MAR))+((1/E)*TEW)-SUM(MAR,PWE(MAR)*EX(MAR));

*******EQUILIBRE

 ABSDOM1(BIEN).. Q(BIEN) =E= C(BIEN)+DINT(BIEN)+INV(BIEN);

 ABSDOM2.. Q("SERNM") =E= C("SERNM") ;


 LOFFRE.. LS =E= SUM(I,LD(I));

 INVEST.. IT =E= SUM(H,EM(H)) + EE + EG + BAC*E ;

********* LOI DE WALRAS

 WALRAS.. LEON =E= Q("SER")-C("SER")-DINT("SER");

 OBJ.. OMEGA =E= 1000;

*******************INITIALISATION DU MODELE*************************************


 XS.L(I) = XSO(I);
 VA.L(I) = VAO(I);
 CIJ.L(i,J) = CIJO(i,J);
 CIT.L(I) = CITO(I);
 LD.L(I) = LDO(I);
 S.FX = SO;
 PVA.L(I) = PVAO(I);
 P.L(I) = PO(I);
 PD.L(I) = PDO(I);
 PQ.L(I) = PQO(I);
 PM.L(MAR) = PMO(MAR);
 PE.L(MAR) = PEO(MAR);
 R.L(MAR) = RO(MAR);
 INV.L(BIEN) = INVO(BIEN);
 IT.L = ITO;
 YM.L(H) = YMO(H);
 YDM.L(H) = YDMO(H);
 YE.L = YEO;
 YG.L = YGO ;
 EM.L(H) = EMO(H);
 EE.L = EEO;
 EG.L = EGO;
 CM.L(H,I) = CMO(H,I);
 C.L(I) = CO(I);
 CG.L(I) = CGO(I) ;
 DINT.L(MAR) = DINTO(MAR);
 TXS.L(MAR) = TXSO(MAR);
 TXM.L(MAR) = TXMO(MAR);
 TXE.L(MAR) = TXEO(MAR);
 TXYM.L(H) = TXYMO(H);
 TXYE.L = TXYEO ;
 D.L(I) = DO(I) ;
 Q.L(I) = QO(I) ;
 M.L(MAR) = MO(MAR) ;
 EX.L(MAR) = EXO(MAR) ;
 PINDEX.fx = PINDEXO;

*******************CLOTURE DU MODELE*********************************

 LS.FX = 35000;
 KD.FX("AGR") = KDO("AGR");
 KD.FX("SER") = KDO("SER");
 KD.FX("IND") = KDO("IND")*1 ;
 CGT.FX = CGTO*1;
 TEW.FX = TEWO ;
 TEM.FX = TEMO ;
 TGM.FX = TGMO ;
 TX.FX("AGR") = TXO("AGR");
 TX.FX("SER") = TXO("SER");
 TX.FX("IND") = TXO("IND");
 TM.FX("AGR") = TMO("AGR");
 TM.FX("SER") = TMO("SER");
 TM.FX("IND") = TMO("IND");
 TYE.FX = TYEO ;
 PWM.FX(MAR) = PWMO(MAR) ;
 PWE.FX(MAR) = PWEO(MAR) ;
 E.FX = EO*1.0 ;
 BAC.l = BACO ;

***********SIMULATION D'UNE augmentation DE 10% de prix a l'exportation et a l'importation

****** BAC.l = BACO- BACO*0.1 ;
TGM.FX = TGMO-TGMO*0.05;

 option limrow=4;


*option nlp=conopt ;
 MODEL MODELE1 /ALL/;
 MODELE1.holdfixed = 1;
 SOLVE MODELE1 MAXIMIZING OMEGA USING NLP;

*$include calcul_a.gms
 display pweo,pwe.l,peo,pe.l

******************CALCUL DES VARIATIONS*****************************************

  parameter ymp(h),ymtran(h),ymenp(h),ymenm(h),ymenr(h),vap(i),ygp,itpi,itpp,ldp(i),tymp(h)
 tyep,rp(i),snp,sp,pqp(i),ldnp(mar),ldqp(i),sgp,pindexp,yep,cp(i),cdd(i),cddd(i),ep,pibo,vccoo(i),
 pibvao,pibbva,pibpva,pibvoo,pibbvo,pibpvo,egp,cgtp,divp(h),ytelp,ysdep,ysenep,xsp(i),thetap(mar), bacvar, MVAR(mar), EXVAR(mar),
  EEVAR, EMVAR(h), QVAR(I), DVAR(I), pdp(mar), CP(I)  ;

 rp(mar) = 100*(r.l(mar)-ro(mar))/ro(mar);
 pqp(i) = 100*(pq.l(i)-pqo(i))/pqo(i);
 ldp(i) = 100*(ld.l(i)-ldo(i))/ldo(i) ;
 vap(i) = 100*(va.l(i)-vao(i))/vao(i) ;
 xsp(i) = 100*(xs.l(i)-xso(i))/xso(i) ;
 pibvao= sum(i,(vao(i)*pvao(i)));
 pibbva = sum(i,(va.l(i)*pva.l(i)));
 pibpva = 100*(pibbva-pibvao)/pibvao ;
 pibvoo= sum(i,(vao(i)));
 pibbvo = sum(i,(va.l(i)));
 pibpvo = 100*(pibbvo-pibvoo)/pibvoo ;
 sp = 100*(s.l-so)/so ;
 egp = 100*(eg.l-ego)/ego ;
 cgtp = 100*(cgt.l-cgto)/cgto ;
 itpi = 100*(it.l-ito)/ito ;
 ygp = 100*(yg.l-ygo)/ygo ;
 yep = 100*(ye.l-yeo)/yeo ;
 ep = 100*(e.l-eo)/eo ;
 pindexp = 100*(pindex.l-pindexo)/pindexo ;
 ymp(h) = 100*(ym.l(h)-ymo(h))/ymo(h);
 tyep = 100*(tye.l-tyeo)/tyeo;
 bacvar = 100*(bac.l-baco)/bacO ;
 MVAR(mar) = 100*(M.L(mar)-MO(mar))/MO(mar) ;
 EXVAR(mar) = 100*(EX.L(mar)-EXO(mar))/EXO(mar) ;
 EMVAR(H) = 100*(EM.L(H)-EMO(H))/EMO(H) ;
 EEVAR = 100*(EE.L-EEO)/EEO ;
 QVAR(I) = 100*(Q.L(I)-QO(I))/QO(I) ;
 DVAR(I) = 100*(D.L(I)-DO(I))/DO(I) ;
 pdp(mar) = 100*(PD.L(mar)-PDO(mar))/PDO(mar)  ;
 cp(i) = 100*(c.L(i)-cO(i))/cO(i)  ;

******************Les fichers de résultats************************************
$ontext
Cette partie de la modélisation permet de visualiser les résultats des simulations
directement dans un fichier EXCEL, ce qui rend les interprétations plus facile.
Le nom du fichier des résultats est "resultpro".
$offtext

 file resultpro/
 resultpro.xls/;
 resultpro.pc=6;
 resultpro.nd=2;
 put resultpro;


 put 'variable' 'branche' 'reference' 'niveau' 'variation'/;
 put 'groupe pauvre'/;
 put 'cgt' put ' ' put cgto put cgt.l put cgtp /;
 loop(h, put 'ym' put h.tl,
 put ymo(h)
 put ym.l(h)
 put ymp(h)/);
 put ' ' /;
*loop(h, put 'TY' put h.tl,
* put TYM(h)
* put TTYM.l(h)
* /);
 put ' ' /;

 loop(i, put 'pq' put i.tl,
 put pqo(i)
 put pq.l(i)
 put pqp(i)/);
 loop(i, put 'c' put i.tl,
 put co(i)
 put c.l(i)
 put cp(i)/);
 loop(mar, put 'PD' put mar.tl,
 put PDo(mar)
 put PD.l(mar)
 put PDP(mar)/);
 loop(i, put 'ld' put i.tl,
 put ldo(i)
 put ld.l(i)
 put ldp(i)/);
 loop(h, put 'EM' put h.tl,
 put EMo(h)
 put EM.l(h)
 put EMVAR(h)/);
 loop(i, put 'D' put i.tl,
 put Do(i)
 put D.l(i)
 put DVAR(i)/);
 loop(i, put 'Q' put i.tl,
 put Qo(i)
 put Q.l(i)
 put QVAR(i)/);
 loop(mar, put 'EX' put mar.tl,
 put EXo(mar)
 put EX.l(mar)
 put EXVAR(mar)/);
 loop(mar, put 'M' put mar.tl,
 put Mo(mar)
 put M.l(mar)
 put MVAR(mar)/);
 loop(i, put 'Va' put i.tl,
 put vao(i)
 put va.l(i)
 put vap(i)/);
 loop(i, put 'xs' put i.tl,
 put xso(i)
 put xs.l(i)
 put xsp(i)/);
 loop(mar, put 'r' put mar.tl,
 put ro(mar)
 put r.l(mar)
 put rp(mar)/);
 put ' ' /;
 put 's' put ' ' put so put s.l put sp /;
 put 'yg' put ' ' put ygo put yg.l put ygp /;
 put 'eg' put ' ' put ego put eg.l put egp /;
 put 'EE' put ' ' put EEo put EE.l put EEVAR /;
 put 'cgt' put ' ' put cgto put cgt.l put cgtp /;
 put 'ye' put ' ' put yeo put ye.l put yep /;
 put 'it' put ' ' put ito put it.l put itpi /;
 put 'PIBva' put ' ' put pibvao put pibbva put pibpva /;
 put 'PIBvo' put ' ' put pibvoo put pibbvo put pibpvo /;
 put 'e' put ' ' put eo put e.l put ep /;
 put 'pindex' put ' ' put pindexo put pindex.l put pindexp /;

 put 'TYE' put ' ' put tyeo put tye.l put tyep /;
 put 'bac' put ' ' put baco put bac.l put bacvar /;

***************************************FIN DU PROGRAMME********************************************************
