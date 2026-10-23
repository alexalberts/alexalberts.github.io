# Alex Alberts’ academic website

A static website for GitHub Pages. All public files live in [site/](./site/). There is no build step, JavaScript runtime, external font dependency, analytics, or package installation.

## Preview

From the repository root:

```sh
ruby --disable-gems scripts/preview.rb
```

Open http://127.0.0.1:4173/. The server serves **only** [site/](./site/), so local research sources are not exposed. Stop it with Ctrl+C. Pass another port if needed: `ruby --disable-gems scripts/preview.rb 4174`. The preview helper uses Ruby and WEBrick; these are available on the development Mac. A static server serving this folder also works.

In VS Code, run the **Preview academic website** task. You can also open [site/index.html](./site/index.html) directly.

## Edit content

| Content | File |
| --- | --- |
| Biography, introduction, profile links | [site/index.html](./site/index.html) |
| Research explanation, themes, figures | [site/research.html](./site/research.html) |
| Publications and preprint status | [site/publications.html](./site/publications.html) |
| Courses, textbooks, mentorship | [site/teaching.html](./site/teaching.html) |
| Full academic CV | [site/cv.html](./site/cv.html) |
| Colors, spacing, typography, responsive and print rules | [site/assets/style.css](./site/assets/style.css) |

Navigation is repeated in the five HTML pages. Update all five together. All pages share the simplified contact footer: email, affiliation/address, Scholar and back-to-top links. Preserve the current-page navigation attribute. The Scholar profile is also linked prominently from the homepage. Contact information is in each footer and the CV header.

To add a publication, copy one publication article, choose a unique ID, and update its year, title, full author list, venue, status, DOI, publisher and arXiv links. Keep published papers newest first, followed by the preprint section. A preprint and its published version share one entry. Update the CV at the same time.

The site uses the supplied CV as the authority for appointments and course dates. Teaching-assistant terms were not supplied and are omitted. Future service is identified as future work.

## Replace images

- Replace [site/assets/headshot.jpg](./site/assets/headshot.jpg) with the intended public portrait. Adjust the image width/height and alt text in the homepage if needed.
The downloadable CV was removed to avoid maintaining an easily outdated PDF. Academic background remains available in the HTML CV. Headers contain navigation only; there is no logo or monogram favicon.

- The four editable [ensemble SVGs](./site/assets/ensemble-possibilities.svg) form a conceptual illustration. The companion files are [prior](./site/assets/ensemble-prior.svg), [conditioning](./site/assets/ensemble-conditioning.svg), and [prediction](./site/assets/ensemble-prediction.svg). Their headings, explanations and alternative text live in the Research HTML.

## Figure provenance and interpretation

The ensemble illustration is original website artwork. Its curves and relative weights are illustrative, not results from a paper. It distinguishes physical prior assumptions from observation conditioning and shows a distribution over functions, rather than only an optimum. Opacity and line width encode relative weight; observations have error bars; the last panel retains curves and a mean/spread summary. It describes the physics-informed IFT work, not every publication.

[The conductivity image](./site/assets/thermal-conductivity.png) is a raster conversion of the authors’ Figure 2(b) from the supplied thermal-insulation manuscript, linked to the corresponding Acta Materialia paper on the site. The original axes, legend, data/extrapolation boundary, posterior samples, median and 95% central credible interval are preserved. This selected plot contains no third-party photograph or composite illustration. Its attribution and a full-resolution link appear below the image. No full manuscript PDF or manuscript source is distributed.

The [Brownian motion panel](./site/assets/brownian-motion-samples.png) and [neural-network panel](./site/assets/bnn-brownian-samples.png) reproduce Figure 2 from the supplied Mercer-prior manuscript. They compare exact Brownian motion samples with Bayesian neural-network samples generated using 1,000 prior eigenvalues. The [true covariance](./site/assets/brownian-motion-covariance.png) and [empirical BNN covariance](./site/assets/bnn-brownian-covariance.png) panels reproduce Figure 3 from the same manuscript. The four panels form one row on desktop, two columns on tablets, and one column on phones. These are author-generated plots, with original axes and titles preserved and no third-party image content. All four are attributed on the Research page and link to full-resolution images. The original manuscript and source PDFs remain excluded from deployment.

## Publish with GitHub Pages

The public URL is https://alexalberts.github.io/ and the repository is https://github.com/alexalberts/alexalberts.github.io.

This is a static HTML/CSS site with no build step. In the repository's **Settings → Pages → Build and deployment**, choose **GitHub Actions** as the source. The [Pages workflow](./.github/workflows/pages.yml) uploads only [site/](./site/); never change its upload path to the repository root.

The workflow runs **manually only**. Editing or pushing files does not publish changes automatically. To publish a future update:

1. Edit the public pages or assets and preview locally.
2. Review the files being committed. Stage only the intended website and maintenance files; keep local research sources excluded.
3. Commit and push to `main`.
4. Open [Actions → Publish website](https://github.com/alexalberts/alexalberts.github.io/actions/workflows/pages.yml), choose **Run workflow**, select `main`, and confirm **Run workflow**.
5. Wait for the deployment to succeed, then check the public website.

Reference: [GitHub's custom Pages workflow documentation](https://docs.github.com/en/pages/getting-started-with-github-pages/using-custom-workflows-with-github-pages).

## Local materials excluded from Git

[.gitignore](./.gitignore) excludes the seven manuscript project folders, the CV LaTeX source folder, research and teaching statements, the original portrait, the instruction document, the short local profile reference and local preview scratch files. It uses explicit root paths rather than broad extension rules, so final public assets remain trackable. Original materials remain in place.

Before committing, use:

```sh
git status --short --untracked-files=all
git diff --cached --name-only
git diff --cached
```

Only intended public files and maintenance/deployment files should be staged. Never stage an entire new research folder before adding its precise ignore rule. The Git index and branch history initially contained only the original README; no manuscript sources were tracked in that history.

If the local Git command reports missing Apple command-line tools, install them before using the terminal Git workflow. GitHub’s web interface can also commit public website files and run the deployment workflow.

## Review checks

Implementation checks covered all five pages at 320, 390, 768 and 1280 CSS pixels, with no horizontal overflow. Local navigation, anchors and image loading passed; text palette contrast exceeds 4.5:1. Desktop/mobile screenshots were inspected. The downloadable CV has since been removed. Publisher, arXiv and textbook destinations were checked against public records; some publishers restrict automated access.

After future edits, repeat these checks and review the Git diff before publication.
