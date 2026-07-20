# Plantilla LaTeX para trabajos de titulación

Plantilla para redactar trabajos de titulación de la Universidad de Cuenca. Incluye la clase `uctesis.cls`, secciones de ejemplo, bibliografía y recursos gráficos.

También puede utilizarse directamente como [plantilla en Overleaf](https://www.overleaf.com/read/tjyrnksfmrtf#7be6b6).

> **Importante:** no modificar `uctesis.cls`. Personalizar únicamente `main.tex`, los archivos de `content/` y `references.bib`.

## Uso local en Windows

1. Instalar [Strawberry Perl](https://strawberryperl.com/) de 64 bits con las opciones predeterminadas.
2. Instalar [MiKTeX](https://miktex.org/download), preferiblemente solo para el usuario actual y con la instalación automática de paquetes faltantes habilitada.
3. Abrir **MiKTeX Console**, buscar actualizaciones e instalarlas.
4. Instalar [Visual Studio Code](https://code.visualstudio.com/) y la extensión **LaTeX Workshop**.
5. En VS Code, abrir `Preferences: Open User Settings (JSON)` y agregar:

```json
"latex-workshop.latex.autoBuild.run": "onSave",
"latex-workshop.view.pdf.viewer": "tab",
"latex-workshop.latex.tools": [
  {
    "name": "latexmk-xelatex",
    "command": "latexmk",
    "args": [
      "-xelatex",
      "-synctex=1",
      "-interaction=nonstopmode",
      "-file-line-error",
      "%DOC%"
    ]
  }
],
"latex-workshop.latex.recipes": [
  {
    "name": "latexmk-xelatex",
    "tools": ["latexmk-xelatex"]
  }
],
"latex-workshop.latex.recipe.default": "latexmk-xelatex"
```

## Clonar el repositorio

1. Abrir PowerShell o una terminal.
2. Clonar el repositorio y entrar en la carpeta:

```powershell
git clone https://github.com/OssianGH/plantilla-tesis-ucuenca.git
cd plantilla-tesis-ucuenca
```

3. Abrir el proyecto en Visual Studio Code:

```powershell
code .
```

Editar `main.tex` y/o los archivos de `content/`. Para compilar, guardar el documento o ejecutar `LaTeX Workshop: Build LaTeX project` desde la paleta de comandos. Usar `LaTeX Workshop: View LaTeX PDF` para ver el resultado.

La plantilla debe compilarse con **XeLaTeX** para funcionar correctamente. No utilizar pdfLaTeX.

También puedes compilar desde una terminal situada en la raíz del proyecto:

```powershell
latexmk -xelatex main.tex
```

## Archivos principales

- `main.tex`: datos generales y orden de las secciones.
- `uctesis.cls`: formato de la plantilla; no modificar este archivo.
- `content/`: contenido del documento y recursos gráficos.
- `references.bib`: referencias bibliográficas.
