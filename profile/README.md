# JurisAtlas

Open-source Model Context Protocol (MCP) infrastructure connecting legal research environments, desktop AI clients, and document workflows directly to official national legislation registries and multi-tier court databases across 42 jurisdictions.

Each repository in this organization is a standalone, jurisdiction-specific server indexing enacted statutes and judicial decisions across three procedural tiers: **First Instance** (District, Municipal, Commercial, and Administrative trial courts), **Second Instance** (Cantonal, Regional, County, and Circuit Courts of Appeal), and **Courts of Last Resort** (Supreme, Cassation, and Constitutional Courts). Every repository provides documentation in both the **official language of that jurisdiction and English**.

---

## Installation & AI Client Selection

### Interactive Desktop Setup Utility (Windows & macOS)

Each package includes a graphical setup utility that allows practitioners to select which AI application(s) they use without running terminal commands or editing configuration files manually:

1. Open the target jurisdiction repository below, select **Code -> Download ZIP**, and extract the archive.
2. Run **`Click_Here_To_Install_Windows.bat`** (Windows) or **`Click_Here_To_Install_Mac.command`** (macOS).
3. In the setup window, select the AI client(s) installed on your system:
   - **Claude Desktop & Claude Code CLI**
   - **ChatGPT Desktop & OpenAI Codex CLI**
   - **Cursor**
   - **Windsurf**
   - **VS Code (GitHub Copilot / Cline / Roo Code)**
   - **Google Antigravity / Gemini CLI**
   - **Perplexity Desktop / Continue.dev / LM Studio**
4. Click **Install to Selected AI Clients** and restart your chosen AI application.

The installer creates an isolated Python runtime inside the extracted folder and registers the read-only MCP server entry only in the client configuration files you select, without accessing or modifying personal files.

### Interactive Command-Line Setup (`uvx` / Terminal — No Git Required)

Paste the single command below into your terminal or PowerShell. It opens an **interactive prompt** asking **which country (or countries)** you want to install and **which AI application(s)** you use (**Claude Desktop, Claude Code CLI, ChatGPT Desktop, OpenAI Codex CLI, Cursor, Windsurf, VS Code / GitHub Copilot, Cline, Google Antigravity / Gemini CLI, Perplexity, Continue.dev, LM Studio**), then configures them automatically without requiring Git:

```bash
uvx --from https://github.com/jurisatlas/cli/archive/refs/heads/main.zip jurisatlas
```

Or if you do not have `uv` installed yet:
- **Windows (PowerShell):**
  ```powershell
  irm https://raw.githubusercontent.com/jurisatlas/.github/main/install.ps1 | iex
  ```
- **macOS / Linux:**
  ```bash
  bash <(curl -fsSL https://raw.githubusercontent.com/jurisatlas/.github/main/install.sh)
  ```

---

## Standardized Tool Interface

Every package implements six uniform tools:

| Tool | Function |
|:---|:---|
| `search_legislation` | Queries enacted national statutes, codes, decrees, and official gazette publications. |
| `search_case_law` | Queries national case law registries and ECLI-indexed judgments. |
| `search_tiered_court_decisions` | Filters jurisprudence by procedural stage (`first_instance`, `appellate_regional`, `supreme_constitutional`) or specific regional/cantonal court key (`sub_court`). |
| `list_court_hierarchy` | Returns the complete three-tier judicial structure and official court sub-portal endpoints for the jurisdiction. |
| `get_legal_document_markdown` | Retrieves full statutory or judicial texts and converts them into structured Markdown. |
| `verify_citation` | Cross-references statutory and judicial citations against official registries.

---

## Jurisdiction Directory (42 Repositories)

### Common Law & Supranational

| Jurisdiction | Repository | First & Intermediate Appellate Tiers | Courts of Last Resort | Primary Official Portals |
|:---|:---|:---|:---|:---|
| **United Kingdom** | [`jurisatlas/uk-legal-mcp`](https://github.com/jurisatlas/uk-legal-mcp) | County, Crown, High Court (`EWHC`), First-tier/Upper Tribunals, Court of Appeal (`EWCA Civ/Crim`) | UK Supreme Court (`UKSC`), Privy Council (`JCPC`) | `legislation.gov.uk`, `caselaw.nationalarchives.gov.uk`, `judiciary.uk` |
| **United States** | [`jurisatlas/us-legal-mcp`](https://github.com/jurisatlas/us-legal-mcp) | 94 Federal District Courts, Bankruptcy Courts, 13 Federal Circuit Courts of Appeals, State Trial & Appellate | Supreme Court of the United States (`SCOTUS`), 50 State Supreme Courts | `uscode.house.gov`, `ecfr.gov`, `courtlistener.com` |
| **Australia** | [`jurisatlas/au-legal-mcp`](https://github.com/jurisatlas/au-legal-mcp) | State District/Magistrates Courts, Federal Court (`FCA`), State Supreme & Appellate Courts (`NSWCA`, `VSCA`, `QCA`) | High Court of Australia (`HCA`) | `legislation.gov.au`, `caselaw.nsw.gov.au`, `hcourt.gov.au` |
| **New Zealand** | [`jurisatlas/nz-legal-mcp`](https://github.com/jurisatlas/nz-legal-mcp) | District Court (`NZDC`), Employment/Family/Environment Courts, High Court (`NZHC`), Court of Appeal (`NZCA`) | Supreme Court of New Zealand (`NZSC`) | `legislation.govt.nz`, `courtsofnz.govt.nz` |
| **European Union** | [`jurisatlas/eu-legal-mcp`](https://github.com/jurisatlas/eu-legal-mcp) | National Referring Courts (Art. 267 TFEU), General Court of the EU (`EGC`) | Court of Justice (`CJEU`), European Court of Human Rights (`ECHR`) | `publications.europa.eu` (CELLAR), `curia.europa.eu` |

### EFTA & Alpine Jurisdictions

| Jurisdiction | Repository | First & Intermediate Appellate Tiers | Courts of Last Resort | Primary Official Portals |
|:---|:---|:---|:---|:---|
| **Switzerland** | [`jurisatlas/ch-legal-mcp`](https://github.com/jurisatlas/ch-legal-mcp) | District Courts (`Bezirksgerichte`), 26 Cantonal Appellate Courts (`Obergerichte` / `Kantonsgerichte`), `BVGer`, `BStGer` | Federal Supreme Court (`BGer` / `TF`) | `fedlex.admin.ch`, `entscheidsuche.ch`, `bger.ch` |
| **Norway** | [`jurisatlas/no-legal-mcp`](https://github.com/jurisatlas/no-legal-mcp) | 23 District Courts (`Tingretter`), 6 Courts of Appeal (`Lagmannsretter`) | Supreme Court (`Norges Høyesterett`) | `api.lovdata.no`, `lovdata.no`, `domstol.no` |
| **Iceland** | [`jurisatlas/is-legal-mcp`](https://github.com/jurisatlas/is-legal-mcp) | 8 District Courts (`Héraðsdómstólar`), Court of Appeal (`Landsréttur`) | Supreme Court (`Hæstiréttur Íslands`) | `althingi.is/lagasafn`, `domstolar.is` |
| **Liechtenstein** | [`jurisatlas/li-legal-mcp`](https://github.com/jurisatlas/li-legal-mcp) | Princely Court of First Instance (`Fürstliches Landgericht`), Court of Appeal (`Fürstliches Obergericht`) | Supreme Court (`OGH`), Constitutional Court (`StGH`), `VGH` | `gesetze.li`, `gerichtsentscheide.li` |

### Southeastern Europe & Western Balkans

| Jurisdiction | Repository | First & Intermediate Appellate Tiers (Cantonal / Regional / District) | Courts of Last Resort | Primary Official Portals |
|:---|:---|:---|:---|:---|
| **Bosnia and Herzegovina** | [`jurisatlas/ba-legal-mcp`](https://github.com/jurisatlas/ba-legal-mcp) | 28 Municipal Courts in FBiH (`Općinski sudovi`), 19 Basic Courts in RS (`Osnovni sudovi`), **10 Cantonal Courts in FBiH (`Kantonalni sudovi` across all 10 Cantons: Unsko-sanski [Bihać], Posavski [Odžak], Tuzlanski [Tuzla], Zeničko-dobojski [Zenica], Bosansko-podrinjski [Goražde], Srednjobosanski [Novi Travnik], Hercegovačko-neretvanski [Mostar], Zapadnohercegovački [Široki Brijeg], Kanton Sarajevo [Sarajevo], Kanton 10 [Livno])**, **6 District Courts in RS (`Okružni sudovi`: Banja Luka, Bijeljina, Doboj, Istočno Sarajevo, Prijedor, Trebinje)**, Brčko Appellate Court | `Ustavni sud BiH`, `Sud BiH`, `Vrhovni sud FBiH`, `Vrhovni sud RS` | `sudskapraksa.pravosudje.ba`, `katsud-*.pravosudje.ba`, `sluzbenilist.ba` |
| **Serbia** | [`jurisatlas/rs-legal-mcp`](https://github.com/jurisatlas/rs-legal-mcp) | 66 Basic Courts (`Osnovni sudovi`), 25 Higher Courts (`Viši sudovi`), 16 Commercial Courts, **4 Appellate Courts (`Apelacioni sudovi`: Beograd, Novi Sad, Niš, Kragujevac)**, `Upravni sud` | `Vrhovni sud Srbije`, `Ustavni sud Srbije` | `pravno-informacioni-sistem.rs`, `vrhovni.sud.rs`, `*.ap.sud.rs` |
| **Montenegro** | [`jurisatlas/me-legal-mcp`](https://github.com/jurisatlas/me-legal-mcp) | 15 Basic Courts (`Osnovni sudovi`), Commercial Court, Higher Courts (`Viši sud u Podgorici & Bijelom Polju`), `Apelacioni sud CG`, `Upravni sud CG` | `Vrhovni sud Crne Gore`, `Ustavni sud CG` | `sudovi.me/odluke-sudova`, `sluzbenilist.me` |
| **North Macedonia** | [`jurisatlas/mk-legal-mcp`](https://github.com/jurisatlas/mk-legal-mcp) | 27 Basic Courts (`Osnovni sudovi`), **4 Appellate Courts (`Apelacioni sudovi`: Skopje, Bitola, Gostivar, Štip)**, `Upravni sud`, `Viš upraven sud` | `Vrhoven sud na RSM`, `Ustaven sud na RSM` | `sud.mk`, `vsrm.mk`, `slvesnik.com.mk` |
| **Kosovo** | [`jurisatlas/xk-legal-mcp`](https://github.com/jurisatlas/xk-legal-mcp) | 7 Basic Courts (`Gjykatat Themelore`: Prishtinë, Prizren, Pejë, Gjilan, Gjakovë, Mitrovicë, Ferizaj), Commercial Court (`Gjykata Komerciale`), Court of Appeals (`Gjykata e Apelit`) | `Gjykata Supreme e Kosovës`, `Gjykata Kushtetuese` | `gjyqesori-rks.org/aktgjykimet`, `gzk.rks-gov.net` |
| **Albania** | [`jurisatlas/al-legal-mcp`](https://github.com/jurisatlas/al-legal-mcp) | 13 First-Instance General Courts, First-Instance Administrative Courts, Court of Appeal of General Jurisdiction, Administrative Court of Appeal, `GJKKO` | `Gjykata e Lartë`, `Gjykata Kushtetuese` | `gjykatat.gov.al`, `gjykataelarte.gov.al`, `qbz.gov.al` |

### European Union Member States (27)

| Jurisdiction | Repository | First & Intermediate Appellate Tiers | Courts of Last Resort | Primary Official Portals |
|:---|:---|:---|:---|:---|
| **Austria** | [`jurisatlas/at-legal-mcp`](https://github.com/jurisatlas/at-legal-mcp) | `Bezirksgerichte`, `Landesgerichte`, 4 `Oberlandesgerichte` (Wien, Graz, Linz, Innsbruck), 9 `LVwG`, `BVwG`, `BFG` | `OGH`, `VfGH`, `VwGH` | `data.bka.gv.at/ris/api/v2.6` |
| **Belgium** | [`jurisatlas/be-legal-mcp`](https://github.com/jurisatlas/be-legal-mcp) | `Tribunaux de première instance` / `Rechtbanken van eerste aanleg`, 5 `Cours d'appel` / `Hoven van beroep` | `Cour de cassation`, `Cour constitutionnelle`, `Conseil d'État` | `juportal.be`, `ejustice.just.fgov.be` |
| **Bulgaria** | [`jurisatlas/bg-legal-mcp`](https://github.com/jurisatlas/bg-legal-mcp) | 113 District Courts (`Районни съдилища`), 28 Regional & 28 Admin Courts, 5 Courts of Appeal (`Апелативни съдилища`) | `ВКС`, `ВАС`, `Конституционен съд` | `legalacts.justice.bg`, `dv.parliament.bg` |
| **Croatia** | [`jurisatlas/hr-legal-mcp`](https://github.com/jurisatlas/hr-legal-mcp) | Municipal & Commercial Courts (`Općinski / Trgovački sudovi`), 15 County Courts (`Županijski sudovi`), High Commercial/Admin/Criminal Courts | `Vrhovni sud RH`, `Ustavni sud RH` | `odluke.sudovi.hr`, `narodne-novine.nn.hr` |
| **Cyprus** | [`jurisatlas/cy-legal-mcp`](https://github.com/jurisatlas/cy-legal-mcp) | 6 District Courts (`Επαρχιακά Δικαστήρια`), Administrative/Commercial Courts, Court of Appeal (`Εφετείο`) | Supreme Constitutional Court, Supreme Court | `cylaw.org` |
| **Czechia** | [`jurisatlas/cz-legal-mcp`](https://github.com/jurisatlas/cz-legal-mcp) | 86 District Courts (`Okresní soudy`), 8 Regional Courts (`Krajské soudy`), 2 High Courts (`Vrchní soudy`) | `Nejvyšší soud`, `NSS`, `Ústavní soud` | `rozhodnuti.justice.cz`, `nsoud.cz`, `e-sbirka.cz` |
| **Denmark** | [`jurisatlas/dk-legal-mcp`](https://github.com/jurisatlas/dk-legal-mcp) | 24 District Courts (`Byretter`), Maritime & Commercial High Court, `Østre Landsret` & `Vestre Landsret` | `Højesteret` | `domsdatabasen.dk`, `retsinformation.dk` |
| **Estonia** | [`jurisatlas/ee-legal-mcp`](https://github.com/jurisatlas/ee-legal-mcp) | 4 County Courts (`Maakohtud`), 2 Administrative Courts (`Halduskohtud`), 2 Circuit Courts (`Ringkonnakohtud`) | `Riigikohus` | `riigiteataja.ee/kohtulahendid`, `riigikohus.ee` |
| **Finland** | [`jurisatlas/fi-legal-mcp`](https://github.com/jurisatlas/fi-legal-mcp) | 20 District Courts (`Käräjäoikeudet`), 6 Admin Courts (`Hallinto-oikeudet`), 5 Courts of Appeal (`Hovioikeudet`) | `Korkein oikeus (KKO)`, `KHO` | `finlex.fi/fi/oikeus` |
| **France** | [`jurisatlas/fr-legal-mcp`](https://github.com/jurisatlas/fr-legal-mcp) | `Tribunaux judiciaires`, `Tribunaux de commerce`, `Tribunaux administratifs`, 36 `Cours d'appel`, 9 `CAA` | `Cour de cassation`, `Conseil d'État`, `Conseil constitutionnel` | `courdecassation.fr` (Judilibre), `legifrance.gouv.fr` |
| **Germany** | [`jurisatlas/de-legal-mcp`](https://github.com/jurisatlas/de-legal-mcp) | `Amtsgerichte`, `Landgerichte`, `VG`, `ArbG`, `SG`, `FG`, 24 `Oberlandesgerichte (OLG)`, `OVG/VGH`, `LAG`, `LSG` | `BVerfG`, `BGH`, `BVerwG`, `BFH`, `BAG`, `BSG` | `de.openlegaldata.io`, `rechtsprechung-im-internet.de`, `gesetze-im-internet.de` |
| **Greece** | [`jurisatlas/gr-legal-mcp`](https://github.com/jurisatlas/gr-legal-mcp) | Courts of First Instance (`Πρωτοδικεία`), 19 Civil/Criminal & Administrative Courts of Appeal (`Εφετεία`) | `Άρειος Πάγος`, `Συμβούλιο της Επικρατείας` | `areiospagos.gr`, `adjustice.gr`, `et.gr` |
| **Hungary** | [`jurisatlas/hu-legal-mcp`](https://github.com/jurisatlas/hu-legal-mcp) | 113 District Courts (`Járásbíróságok`), 20 Regional Courts (`Törvényszékek`), 5 Regional Courts of Appeal (`Ítélőtáblák`) | `Kúria`, `Alkotmánybíróság` | `eakta.birosag.hu`, `njt.hu` |
| **Ireland** | [`jurisatlas/ie-legal-mcp`](https://github.com/jurisatlas/ie-legal-mcp) | District Court, Circuit Court, High Court of Ireland (`IEHC`), Court of Appeal (`IECA`) | Supreme Court of Ireland (`IESC`) | `courts.ie/judgments`, `irishstatutebook.ie` |
| **Italy** | [`jurisatlas/it-legal-mcp`](https://github.com/jurisatlas/it-legal-mcp) | `Tribunali Ordinari`, 20 Regional Administrative Courts (`TAR`), 26 `Corti d'Appello` | `Corte Suprema di Cassazione`, `Consiglio di Stato`, `Corte Costituzionale` | `italgiure.giustizia.it`, `giustizia-amministrativa.it`, `normattiva.it` |
| **Latvia** | [`jurisatlas/lv-legal-mcp`](https://github.com/jurisatlas/lv-legal-mcp) | 9 District/City Courts (`Rajona tiesas`), Admin District Court, 5 Regional Courts (`Apgabaltiesas`) | `Augstākā tiesa (Senāts)`, `Satversmes tiesa` | `eli.tiesas.lv`, `likumi.lv` |
| **Lithuania** | [`jurisatlas/lt-legal-mcp`](https://github.com/jurisatlas/lt-legal-mcp) | 12 District Courts (`Apylinkės teismai`), 5 Regional Courts (`Apygardos teismai`), Court of Appeal | `LAT`, `LVAT`, `Konstitucinis Teismas` | `liteko.teismai.lt`, `e-tar.lt` |
| **Luxembourg** | [`jurisatlas/lu-legal-mcp`](https://github.com/jurisatlas/lu-legal-mcp) | `Justices de paix`, 2 `Tribunaux d'arrondissement`, `Tribunal administratif`, `Cour d'appel`, `Cour administrative` | `Cour de cassation`, `Cour constitutionnelle` | `justice.public.lu`, `legilux.public.lu` |
| **Malta** | [`jurisatlas/mt-legal-mcp`](https://github.com/jurisatlas/mt-legal-mcp) | Court of Magistrates, Civil Court (First Hall, Commercial, Family), Court of Appeal (`Qorti tal-Appell`) | Constitutional Court of Malta | `ecourts.gov.mt`, `legislation.mt` |
| **Netherlands** | [`jurisatlas/nl-legal-mcp`](https://github.com/jurisatlas/nl-legal-mcp) | 11 District Courts (`Rechtbanken`), 4 Courts of Appeal (`Gerechtshoven`), `CRvB`, `CBb` | `Hoge Raad der Nederlanden`, `Raad van State` | `data.rechtspraak.nl`, `wetten.overheid.nl` |
| **Poland** | [`jurisatlas/pl-legal-mcp`](https://github.com/jurisatlas/pl-legal-mcp) | 318 District Courts (`Sądy Rejonowe`), 47 Regional Courts (`Sądy Okręgowe`), 16 `WSA`, 11 Courts of Appeal (`Sądy Apelacyjne`) | `Sąd Najwyższy`, `NSA`, `Trybunał Konstytucyjny` | `saos.org.pl`, `orzeczenia.ms.gov.pl`, `api.sejm.gov.pl` |
| **Portugal** | [`jurisatlas/pt-legal-mcp`](https://github.com/jurisatlas/pt-legal-mcp) | 23 Judicial District Courts (`Tribunais de Comarca`), `TAF`, 5 Courts of Appeal (`Tribunais da Relação`), 2 `TCA` | `STJ`, `STA`, `Tribunal Constitucional` | `dgsi.pt`, `diariodarepublica.pt` |
| **Romania** | [`jurisatlas/ro-legal-mcp`](https://github.com/jurisatlas/ro-legal-mcp) | 176 Local Courts (`Judecătorii`), 42 County Courts (`Tribunale`), 15 Courts of Appeal (`Curți de Apel`) | `ÎCCJ (scj.ro)`, `Curtea Constituțională` | `rejust.ro`, `scj.ro`, `legislatie.just.ro` |
| **Slovakia** | [`jurisatlas/sk-legal-mcp`](https://github.com/jurisatlas/sk-legal-mcp) | District & City Courts (`Okresné / Mestské súdy`), 3 Admin Courts, 8 Regional Courts (`Krajské súdy`) | `Najvyšší súd SR`, `NSS SR`, `Ústavný súd SR` | `obcan.justice.sk`, `slov-lex.sk` |
| **Slovenia** | [`jurisatlas/si-legal-mcp`](https://github.com/jurisatlas/si-legal-mcp) | 44 Local Courts (`Okrajna sodišča`), 11 District Courts (`Okrožna sodišča`), 4 Higher Courts (`Višja sodišča`) | `Vrhovno sodišče RS`, `Ustavno sodišče RS` | `sodnapraksa.si`, `pisrs.si` |
| **Spain** | [`jurisatlas/es-legal-mcp`](https://github.com/jurisatlas/es-legal-mcp) | `Juzgados de Primera Instancia / Mercantil / Social`, 50 `Audiencias Provinciales`, 17 `TSJ`, `Audiencia Nacional` | `Tribunal Supremo`, `Tribunal Constitucional` | `poderjudicial.es` (CENDOJ), `boe.es` |
| **Sweden** | [`jurisatlas/se-legal-mcp`](https://github.com/jurisatlas/se-legal-mcp) | 48 District Courts (`Tingsrätter`), 12 Admin Courts (`Förvaltningsrätter`), 6 `Hovrätter`, 4 `Kammarrätter` | `Högsta domstolen (HD)`, `HFD` | `rattspraxis.etjanst.domstol.se`, `data.riksdagen.se` |

---

## License

All packages in this organization are released under the MIT License.
