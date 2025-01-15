# December goals
### 12-18 dicembre
- [x] Understanding debug sub system protocol and rtl
- [ ] Understanding bus sub-system protocol and rtl
- [x] Understanding briefly the X-heep architecture
- [x] Familiarize with JTAG
### 18-22 dicembre
- [ ] Install and understand verilator
- [ ] Install and understand OpenOCD
- [ ] Test each tool with example designs
- [ ] Explore jtag sequences
	- [ ] Simulate a simple JTAG operation:
	- [ ] Implement a TAP state machine in Verilog/SystemVerilog.
	- [ ] Use Verilator to simulate and GTKWave to view the transitions.
	- [ ] Begin exploring how JTAG communicates with the debug subsystem.
### 27-30 dicembre
- [ ] research clock gating strategies (latch base gating, enable signals)
	- [ ] https://www.edn.com/clock-gating-smart-use-ensures-smart-returns/
- [ ] define module inputs/outputs and expected behavior
- [ ] draft a simple sv model
- [ ] Study how bus transactions (address, data, control) are structured in X-heep.
- [ ] Define signals to monitor and log (e.g., bus activity tracking format).
- [ ] Outline a basic design for the sniffer module.



## Fase 1: **(Adesso – 12 febbraio)**

**Obiettivo**: impostare le basi teoriche e la pianificazione dettagliata, avendo un’ora di lavoro al giorno.

### Settimana 1 (da oggi a circa fine settimana prossima)

- **Consolidamento concetti**:
    - Rivedi la documentazione del _Debug Subsystem_ e la struttura JTAG (ti servirà per integrare il tuo bus sniffer e il clock gating module).
    - Approfondisci internamente i segnali e le linee di controllo/monitor richieste per il bus sniffer.
- **Piano dettagliato design bus sniffer**:
    - Stila un _block diagram_ ad alto livello: ingressi (bus su cui “sniffare”), segnali di abilitazione, uscite (log o report).
    - Decidi come vuoi memorizzare o inviare le transazioni “sniffate”.

### Settimana 2

- **Clock Gating Module**:
    - Definisci bene le specifiche: devi solo “gated clock” o anche “reset” condizionato? Se sì, come?
    - Fai uno schema a blocchi, chiarendo come il segnale di abilitazione/disabilitazione del clock verrà controllato (da software? da JTAG?).
- **Strategia di integrazione**:
    - Come intendi connettere fisicamente (o in HDL) il bus sniffer e il clock gating module con il resto dell’SoC (riferisciti alla figura che hai allegato).
    - Identifica i “punti di tap” del bus subsystem per il bus sniffer.

### Settimana 3

- **OpenOCD e modulo software**:
    - Dedica il tempo di studio a comprendere come OpenOCD gestisce i comandi Telnet.
    - Prendi appunti su come avverrà la traduzione delle transazioni di testbench → comandi Telnet → OpenOCD.
    - Stabilisci gli _use case_ essenziali (lettura di registri, scrittura in memoria, break, run/stop del core, ecc.).

### Settimana 4 (fino al 12 febbraio)

- **Piano UVM Testbench**:
    - Delinea la struttura della testbench UVM: _agent_, _driver_, _monitor_, _scoreboard_, ecc.
    - Pianifica come orchestrare i test: quali transazioni vuoi generare e come raccogliere i dati dal bus sniffer per il confronto.
- **Bozza iniziale documentazione**:
    - Inizia a scrivere capitoli introduttivi della tesi (motivi, obiettivi, stato dell’arte) o integra le parti teoriche già fatte.

_(Fino a qui, hai lavorato circa 1 ora al giorno: l’obiettivo è avere un quadro chiaro di cosa devi implementare e come incastrare i blocchi.)_

---

## Fase 2: **(12 febbraio – fine febbraio)**

**Obiettivo**: cominciare l’implementazione vera e propria dei moduli hardware (bus sniffer e clock gating), ora che puoi lavorare 6 ore al giorno.

### Settimana 5 (12 – 18 febbraio)

- **Implementazione HDL Bus Sniffer**:
    - Inizia a scrivere il codice RTL (Verilog/VHDL o SystemVerilog) del modulo bus sniffer basandoti sullo schema fatto.
    - Prepara una piccola _testbench_ standalone (anche non UVM) per provare i concetti base (controlla che riesca a “sniffare” correttamente un bus fittizio).

### Settimana 6 (19 – 25 febbraio)

- **Implementazione HDL Clock Gating Module**:
    - Scrivi e sintetizza il codice del clock gating module (inclusa logica di reset, se prevista).
    - Verifica in simulazione standalone il funzionamento (accensione/spegnimento del clock, reset CPU, etc.).

_(Entro fine febbraio, dovresti avere i due moduli RTL principali pronti e testati a livello elementare.)_

---

## Fase 3: **(fine febbraio – metà marzo)**

**Obiettivo**: integrare i moduli nell’SoC e iniziare a predisporre la struttura della testbench UVM.

### Settimana 7 (26 febbraio – 3 marzo)

- **Integrazione nell’SoC (FPGA Co-Emulation Environment)**:
    - Collega fisicamente (in HDL) il bus sniffer al bus subsystem.
    - Inserisci il clock gating module come mostrato nel diagramma (tra il clock di sistema e la CPU).
- **Primi test su FPGA (se possibile)**:
    - Se hai la possibilità di implementare parzialmente su FPGA, prova a fare un check di funzionamento basilare (anche con un semplice blinking o un test di lettura/scrittura su bus).

### Settimana 8 (4 – 10 marzo)

- **Strutturazione UVM Testbench**:
    - Crea i componenti UVM (sequence, sequencer, driver, monitor, scoreboard) almeno a livello scheletrico.
    - Definisci i _transaction items_ (ad es. un oggetto UVM che rappresenta un’operazione di lettura/scrittura sul bus).
- **Prova di comunicazione con OpenOCD**:
    - Avvia OpenOCD e vedi come comunicare via Telnet per funzioni base (read/write di registri CPU, break, run, stop).
    - Butta giù lo scheletro del modulo software che traduce le transazioni testbench → comandi Telnet.

---

## Fase 4: **(metà marzo – metà aprile)**

**Obiettivo**: completare il modulo software per interfacciare la testbench con OpenOCD e consolidare la testbench UVM.

### Settimana 9-10 (11 – 24 marzo)

- **Modulo software (adapter) – sviluppo**:
    - Implementa la logica di parsing/creazione comandi Telnet.
    - Testa con una mini-applicazione o script Python che invia/legge i comandi da OpenOCD.
- **Collegamento UVM – adapter**:
    - Integra il modulo software in modo che la testbench (in SystemVerilog) possa chiamarlo (tramite DPI-C o altra interfaccia) per generare comandi.
    - Esegui i primi test di loopback per assicurarti che la catena testbench → adapter → OpenOCD → SoC funzioni.

### Settimana 11 (25 – 31 marzo)

- **UVM Testbench – consolidamento**:
    - Completa la parte di _checker/scoreboard_ che confronta i risultati reali (dal SoC) con quelli attesi.
    - Configura i _sequence_ di test più elementari (es. letture/scritture su bus, break e resume CPU, ecc.).
- **Bus Sniffer – integrazione logs**:
    - Verifica che i dati “sniffati” vengano acquisiti correttamente dal testbench o salvati in un log.
    - Se intendi confrontare i log con una simulazione RTL di riferimento, prepara l’ambiente di confronto.

---

## Fase 5: **(aprile)**

**Obiettivo**: validare l’intero flusso (bus sniffer, clock gating, UVM testbench, OpenOCD) e preparare i risultati sperimentali da mettere in tesi.

### Settimana 12-13 (1 – 14 aprile)

- **Test su veri scenari**:
    - Avvia test più complessi (letture in RAM, scritture in registri periferiche, uso di interrupt).
    - Metti sotto stress il bus sniffer: controlla che intercetti correttamente transazioni multiple.
    - Controlla il funzionamento del clock gating module quando effettui pause o reset condizionato della CPU.
- **Debug & refine**:
    - Analizza i risultati, correggi bug/limiti nelle implementazioni.
    - Ottimizza eventuali colli di bottiglia (es. buffer del bus sniffer).

### Settimana 14-15 (15 – 28 aprile)

- **Confronto con simulazione RTL**:
    - Esegui in parallelo una simulazione classica RTL (magari con i waveforms) e controlla che la lista di transazioni generata dal bus sniffer corrisponda.
    - Documenta le eventuali discrepanze e risolvile.
- **Rifinitura testbench UVM**:
    - Aggiungi test di corner-case (es. reset asincroni, high-speed bursts su bus, ecc.).
    - Aggiorna la documentazione su come l’UVM testbench è strutturata e come interagisce con OpenOCD.

---

## Fase 6: **(maggio)**

**Obiettivo**: finalizzazione e scrittura finale della tesi, con eventuali dimostrazioni “live” su FPGA.

### Settimana 16-17 (1 – 14 maggio)

- **Implementazione su FPGA**:
    - Se non fatto prima, realizza la build completa su FPGA Xilinx, assicurandoti che i pin e i moduli siano mappati correttamente.
    - Fai i test di funzionamento reale con OpenOCD (collegandoti via JTAG esterna).
    - Verifica la stabilità del clock gating e la corretta registrazione delle transazioni da parte del bus sniffer.
- **Stesura capitoli tecnici**:
    - Scrivi nel dettaglio la parte sul design dei moduli (bus sniffer, clock gating, modulo software).
    - Documenta i risultati ottenuti dai test e la metodologia UVM.

### Settimana 18-19 (15 – 31 maggio)

- **Refactoring & ottimizzazioni finali**:
    - Se ci sono miglioramenti facili o bug piccoli, risolvili.
    - Prepara eventuali _performance metrics_ (quanto occupa in FPGA, frequenza massima di clock, overhead del bus sniffer, ecc.).
- **Consegna tesi & preparazione discussione**:
    - Finalizza la scrittura della tesi (introduzione, background teorico, implementazione, risultati, conclusioni).
    - Prepara eventuali slide e/o demo se è prevista una presentazione.

---

## Consigli generali

1. **Tieni un diario di bordo**: ogni volta che lavori (anche un’ora soltanto), annota cosa hai fatto, problemi emersi e soluzioni tentate.
2. **Integrazione continua**: cerca di integrare i vari pezzi man mano che li completi, per evitare sorprese a fine progetto.
3. **Documentazione costante**: dedica una parte del tempo (anche solo 10-15 minuti al giorno) a scrivere la documentazione tecnica che finirà in tesi; così eviterai accumuli enormi all’ultimo.
4. **Micro-obiettivi settimanali**: se serve, spezzetta ulteriormente i compiti per avere sempre chiaro il traguardo di ogni singola settimana.

Seguendo questo piano, arriverai a fine maggio con:

- Il bus sniffer e il clock gating module integrati e testati su FPGA.
- La testbench UVM funzionante, in grado di orchestrare transazioni e verificare i risultati anche tramite OpenOCD.
- Tutti i risultati (log di transazioni, validazioni di progetto) pronti e ben documentati nella tesi.

Buon lavoro!