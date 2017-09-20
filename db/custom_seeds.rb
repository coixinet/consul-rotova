
Setting['feature.twitter_login'] = false
Setting['feature.facebook_login'] = false
Setting['feature.google_login'] = false

Setting['feature.auto_login'] = false
Setting['feature.auto_verify_users'] = false

Setting['feature.proposals_not_verified'] = true
Setting['feature.signature_sheets'] = false
Setting['feature.polls'] = false

# Privacy page
page = SiteCustomization::Page.find_by(slug: 'privacy')
if page.nil?
  page = SiteCustomization::Page.new(slug: 'privacy')
  page.locale = 'es'
  page.title = 'Privacidad'
  page.status = SiteCustomization::Page::VALID_STATUSES[1]
  page.content = <<-HTML
<h2>AVISO DE PROTECCIÓN DE DATOS</h2>
<ol>
  <li>La navegación por la informacion disponible en el Portal de Gobierno Abierto es anónima.</li>
  <li>Para utilizar los servicios contenidos en el Portal de Gobierno Abierto el usuario deberá darse de alta y proporcionar previamente los datos de carácter personal segun la informacion especifica que consta en cada tipo de alta.</li>
  <li>Los datos aportados serán incorporados y tratados por el Ayuntamiento de acuerdo con la descripción del fichero siguiente:
    <ul>
      <li><strong>Nombre del fichero/tratamiento:</strong> NOMBRE DEL FICHERO</li>
      <li><strong>Finalidad del fichero/tratamiento:</strong> Gestionar los procesos participativos para el control de la habilitación de las personas que participan en los mismos y recuento meramente numérico y estadístico de los resultados derivados de los procesos de participación ciudadana</li>
      <li><strong>Órgano responsable:</strong> ÓRGANO RESPONSABLE</li>
    </ul>
  </li>
  <li>El interesado podrá ejercer los derechos de acceso, rectificación, cancelación y oposición, ante el órgano responsable indicado todo lo cual se informa en el cumplimiento del artículo 5 de la Ley Orgánica 15/1999, de 13 de diciembre, de Protección de Datos de Carácter Personal.</li>
  <li>Como principio general, este sitio web no comparte ni revela información obtenida, excepto cuando haya sido autorizada por el usuario, o la informacion sea requerida por la autoridad judicial, ministerio fiscal o la policia judicial, o se de alguno de los supuestos regulados en el artículo 11 de la Ley Orgánica 15/1999, de 13 de diciembre, de Protección de Datos de Carácter Personal.</li>
</ol>
HTML
  page.save!
end

# Accesibility
page = SiteCustomization::Page.find_by(slug: 'accesibility')
if page.nil?
  page = SiteCustomization::Page.new(slug: 'accesibility')
  page.locale = 'es'
  page.title = 'Accesibilidad'
  page.status = SiteCustomization::Page::VALID_STATUSES[1]

  page.content = <<-HTML
<p>La accesibilidad web se refiere a la posibilidad de acceso a la web y a sus contenidos por todas las personas, independientemente de las discapacidades (físicas, intelectuales o técnicas) que puedan presentar o de las que se deriven del contexto de uso (tecnológicas o ambientales).</p>

<p>Cuando los sitios web están diseñados pensando en la accesibilidad, todos los usuarios pueden acceder en condiciones de igualdad a los contenidos, por ejemplo:</p>

<ul>
  <li>Proporcionando un texto alternativo a las imágenes, los usuarios invidentes o con problemas de visión pueden utilizar lectores especiales para acceder a la información. </li>
  <li>Cuando los vídeos disponen de subtítulos, los usuarios con dificultades auditivas pueden entenderlos plenamente. </li>
  <li>Si los contenidos están escritos en un lenguaje sencillo e ilustrados, los usuarios con problemas de aprendizaje están en mejores condiciones de entenderlos.</li>
  <li>Si el usuario tiene problemas de movilidad y le cuesta usar el ratón, las alternativas con el teclado le ayudan en la navegación.</li>
</ul>

<h2>"Atajos" de teclado</h2>

<p>Para poder navegar por este sitio web de forma accesible, se han programado un grupo de teclas de acceso rápido que recogen las principales secciones de interés general en los que está organizado el sitio.</p>

<div class="small-12 medium-6">
  <table>
    <caption class="sr-only">Atajos de teclado para el menú de navegación</caption>
    <thead>
      <tr>
        <th scope="col" class="text-center">Tecla</th>
        <th scope="col">Página</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td class="text-center">0</td>
        <td>Inicio</td>
      </tr>
      <tr>
        <td class="text-center">1</td>
        <td>Debates</td>
      </tr>
      <tr>
        <td class="text-center">2</td>
        <td>Propuestas</td>
      </tr>
      <tr>
        <td class="text-center">3</td>
        <td>Votaciones</td>
      </tr>
      <tr>
        <td class="text-center">4</td>
        <td>Presupuestos participativos</td>
      </tr>
      <tr>
        <td class="text-center">5</td>
        <td>Procesos legislativos</td>
      </tr>
    </tbody>
  </table>
</div>

<p>Dependiendo del sistema operativo y del navegador que se utilice, la combinación de teclas será la siguiente:</p>

<div class="small-12 medium-6">
  <table>
    <caption class="sr-only">Combinación de teclas dependiendo del sistema operativo y navegador</caption>
    <thead>
      <tr>
        <th scope="col">Navegador</th>
        <th scope="col">Combinación de teclas</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Explorer</td>
        <td>ALT + atajo y luego ENTER</td>
      </tr>
      <tr>
        <td>Firefox</td>
        <td>ALT + MAYÚSCULAS + atajo</td>
      </tr>
      <tr>
        <td>Chrome</td>
        <td>ALT + atajo (si es un MAC, CTRL + ALT + atajo)</td>
      </tr>
      <tr>
        <td>Safari</td>
        <td>ALT + atajo (si es un MAC, CMD + atajo)</td>
      </tr>
      <tr>
        <td>Opera</td>
        <td>MAYÚSCULAS + ESC + atajo</td>
      </tr>
    </tbody>
  </table>
</div>

<h2>Tamaño del texto</h2>
<p>El diseño accesible de este sitio web permite que el usuario pueda elegir el tamaño del texto que le convenga. Esta acción puede llevarse a cabo de diferentes maneras según el navegador que se utilice.</p>

<div class="small-12 medium-6">
  <table>
    <thead>
      <tr>
        <th scope="col">Navegador</th>
        <th scope="col">Acción a realizar </th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Explorer</td>
        <td>Ver > Tamaño del texto</td>
      </tr>
      <tr>
        <td>Firefox</td>
        <td>Ver > Tamaño</td>
      </tr>
      <tr>
        <td>Chrome</td>
        <td>Ajustes (icono) > Opciones > Avanzada > Contenido web > Tamaño fuente</td>
      </tr>
      <tr>
        <td>Safari</td>
        <td>Visualización > ampliar/reducir</td>
      </tr>
      <tr>
        <td>Opera</td>
        <td>Ver > escala</td>
      </tr>
    </tbody>
  </table>
</div>

<p>Otra forma de modificar el tamaño de texto es utilizar los atajos de teclado definidos en los navegadores, en particular la combinación de teclas:</p>

<ul>
  <li><code>CTRL y + (CMD y + en MAC)</code> para aumentar el tamaño del texto</li>
  <li><code> CTRL y - (CMD y - en MAC)</code> para reducir el tamaño del texto</li>
</ul>

<h2>Compatibilidad con estándares y diseño visual</h2>

<p>Todas las páginas de este sitio web cumplen con&nbsp; las <strong>Pautas de Accesibilidad</strong> o Principios Generales de Diseño Accesible establecidas por el Grupo de Trabajo&nbsp;<abbr title="Web Accessibility Initiative" lang="en">WAI</abbr> perteneciente al W3C.</p>
HTML
  page.save!
end

# Condiciones de uso
page = SiteCustomization::Page.find_by(slug: 'conditions')
if page.nil?
  page = SiteCustomization::Page.new(slug: 'conditions')
  page.locale = 'es'
  page.title = 'Condiciones de uso'
  page.status = SiteCustomization::Page::VALID_STATUSES[1]
  page.content = <<-HTML
    <h2>AVISO LEGAL SOBRE LAS CONDICIONES DE USO, PRIVACIDAD Y PROTECCIÓN DE DATOS PERSONALES DEL PORTAL DE GOBIERNO ABIERTO</h2>
    <p>Página de información sobre las condiciones de uso, privacidad y protección de datos personales.</p>
  HTML
  page.save!
end

# FAQ page
page = SiteCustomization::Page.find_by(slug: 'more-information/faq')
if page.nil?
  page = SiteCustomization::Page.new(slug: 'more-information/faq')
  page.locale = 'es'
  page.title = 'Preguntas frecuentes'
  page.status = SiteCustomization::Page::VALID_STATUSES[1]
  page.content = <<-HTML
    <h2>Preguntas frecuentes</h2>
    <p>Página con preguntas frecuentes.</p>
  HTML
  page.save!
end

# How to use page
page = SiteCustomization::Page.find_by(slug: 'more-information/how-to-use')
if page.nil?
  page = SiteCustomization::Page.new(slug: 'more-information/how-to-use')
  page.locale = 'es'
  page.title = 'Utilízalo en tu municipio'
  page.status = SiteCustomization::Page::VALID_STATUSES[1]
  page.content = <<-HTML
    <h2>Utilízalo en tu municipio</h2>
    <p>Utilízalo en tu municipio libremente o ayúdanos a mejorarlo, es software libre.</p>
    <p>Este Portal de Gobierno Abierto usa la <a href="https://github.com/consul">aplicación Consul</a> que es software libre, con <a href="http://www.gnu.org/licenses/agpl-3.0.html">licencia AGPLv3</a>, esto significa en palabras sencillas, que cualquiera puede libremente usar el código, copiarlo, verlo en detalle, modificarlo, y redistribuirlo al mundo con las modificaciones que quiera (manteniendo el que otros puedan a su vez hacer lo mismo). Porque creemos que la cultura es mejor y más rica cuando se libera.</p>
    <p>Si eres programador, puedes ver el código y ayudarnos a mejorarlo en <a href="https://github.com/consul">aplicación Consul</a>.</p>
  HTML
  page.save!
end

# More info
#

page = SiteCustomization::Page.find_by(slug: 'more_info/index')
if page.nil?
  page = SiteCustomization::Page.new(slug: 'more_info/index')
  page.locale = 'ca'
  page.title = 'Més informació'
  page.more_info_flag = true
  page.status = SiteCustomization::Page::VALID_STATUSES[1]
end
page.content = <<-HTML
<div class="jumbo light">
  <div class="row">
    <div class="small-12 column">
      <h2>Descobreix Consul</h2>
      <p class="lead">Aprèn tot el que pots fer en aquest web.</p>
      <p>Aquesta guia explica cadascuna de les seccions de Consul. Pots ampliar la informació en els enllaços de &quot;Informació detallada&quot;.</p>
    </div>
  </div>

  <div class="row">
    <div class="small-12 column">
      <ul class="menu-pages" data-magellan>
        <li>
          <a class="button hollow expanded" href="#debates">Debats</a>
        </li>
        <li>
          <a class="button hollow expanded" href="#proposals">Propostes</a>
        </li>
        <li>
          <a class="button hollow expanded" href="#budgets">Pressupostos participatius</a>
        </li>
        <li>
          <a class="button hollow expanded" href="#other">Altra informació d&#39;interès</a>
        </li>
      </ul>
    </div>
  </div>
</div>

<div id="more-info" class="more-info-content">
  <div class="row">
    <div class="small-12 medium-7 large-8 column">
      <div class="row section-content">
        <div class="small-12 column">
          <h3 id="debates" data-magellan-target="debates">
            Debats
          </h3>
          <p>Crea un fil en el qual debatre sobre qualsevol tema que vulguis compartir amb la resta de gent de la teva ciutat.</p>
          <ul class="features">
            <li>
              Per crear un debat has de <a href="/users/sign_up">registrar-te a Consul</a>
            </li>
            <li>Els debats poden ser valorats utilitzant els botons de <strong>Estic d'acord</strong> o <strong>No estic d'acord</strong> que trobaràs en cada un d'ells.</li>
          </ul>

          <figure>
            <img alt="Botons per valorar els debats" src="/assets/more_info/debates-cc3f95ad118d28df353eb32b7911b6f70bd649a93ed6ec956c8b8fff03d4513d.png" />
            <figcaption>Botons &quot;Estic d&#39;acord&quot; i &quot;No estic d&#39;acord&quot; per valorar els debats.</figcaption>
          </figure>
        </div>
      </div>

      <div class="row section-content">
        <div class="small-12 column">
          <h3 id="proposals" data-magellan-target="proposals">
            Propostes
          </h3>
          <p>Proposa el que vols que l&#39;Ajuntament porti a terme i dóna suport a propostes d&#39;altres persones.</p>
          <ul class="features">
            <li>
              Per crear una proposta has de <a href="/users/sign_up">registrar-te a Consul</a>, a més per recolzar-les has de verificar el teu compte.
            </li>
            <li>Les propostes que aconsegueixin <strong>el suport de l'1% de la gent</strong> (major de 16 anys empadronada a Madrid; 27.064 suports) passen a votació.</li>
            <li>Si hi ha més gent a favor que en contra en la votació, <strong>l'Ajuntament assumeix la proposta i es fa.</strong></li>
          </ul>

          <figure>
            <img alt="Botó per donar suport a una proposta" src="/assets/more_info/proposals_ca-6b0d12ff53ad9c2d41ce18e1ed1c05fccd7acbc9fa74136118de9881f5433a53.png" />
            <figcaption>Botó per "Donar suport" una proposta. <br> Quan arribi al nombre de suports passarà a votació.</figcaption>
          </figure>
        </div>
      </div>

      <div class="row section-content">
        <div class="small-12 column">
          <h3 id="budgets" data-magellan-target="budgets">
            Pressupostos participatius
          </h3>
          <p>Els primers sis mesos de cada any pots decidir com gastar part del pressupost.</p>
          <ul class="features">
            <li>
              Per crear un projecte de despesa has de <a href="/users/sign_up">registrar-te a Consul</a> i verificar el teu compte.
            </li>
            <li>En primer lloc comença la <strong>fase d'acceptació</strong> de projectes de despesa.</li>
            <li>Després hi ha una <strong>fase de suports</strong> per prioritzar el més interessant, les més recolzades són avaluades per l'Ajuntament per veure si són viables i quant valen.</li>
            <li>Al final hi ha una <strong>fase de votació</strong> on es decideix en quins es gasta aquesta part del pressupost.</li>
          </ul>

          <figure>
            <img alt="Diferents fases d&#39;un pressupost participatiu" src="/assets/more_info/budgets_ca-796cc22ee3ec16e5bf09abb5401100c7d917f2f41055847c1af5a9e07f295f0f.png" />
            <figcaption>Fase de "Suports" i fase de "Votació" dels pressupostos participatius.</figcaption>
          </figure>
        </div>
      </div>
    </div>

    <div class="small-12 medium-4 large-3 column more-info-sidebar">
      <div class="sidebar-card">
        <h3>¿Problemes tècnics?</h3>
        <p>Llegeix les preguntes freqüents i resol els teus dubtes.</p>
        <a class="button expanded" href="/more-information/faq">Veure preguntes freqüents</a>
      </div>
    </div>
  </div>

  <div class="row">
    <hr>
    <div class="small-12 column">
      <h3 id="other" data-magellan-target="other">Altra informació d&#39;interès</h3>
      <ul class="features">
        <li><a href="/more-information/how-to-use">Utilitza Consul al teu municipi</a></li>
      </ul>
    </div>
  </div>
</div>
HTML
page.save!


