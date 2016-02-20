<!DOCTYPE html>
<html>
<head>
  <title>{{ page_title }} | {{ company_name }}</title>
</head>
<body>

  <header>
    <a href="/">
      <img src="{{ main_logo }}" alt="{{ company_name }}">
    </a>

    <nav>
      <ul>
        <li><a href="/services/">Services</a></li>
        <li><a href="/products/">Products</a></li>
        <li><a href="/about-us.html">About</a></li>
        <li><a href="/blog/">Blog</a></li>
      </ul>
    </nav>
  </header>

  <main>
    <h1>{{ page_title }}</h1>

    {{ content }}

    {{#posts}}
      <article>

        <header>
          
          <h1>{{ title }}</h1>
          <img src="{{ image }}" alt="">
          <p>By {{ author_name }}</p>

        </header>

        {{ article }}

      </article>
    {{/posts}}

    <aside>{{ support_content }}</aside>
  </main>

  <footer>
    <a href="/">
      <img src="{{ footer_logo }}" alt="{{ company_name }}">
    </a>

    <p>Copyright &copy; 2016, {{ company_name }}. All rights reserved.</p>
  </footer>

</body>
</html>
