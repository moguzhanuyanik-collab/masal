'use strict';
(() => {
  const copyTextMetrics = (from, to) => {
    if (!from || !to) return;
    const c = getComputedStyle(from);
    to.style.fontSize = c.fontSize;
    to.style.lineHeight = c.lineHeight;
    to.style.fontWeight = c.fontWeight;
    to.style.letterSpacing = c.letterSpacing;
  };

  const copyIconBox = (from, to) => {
    if (!from || !to) return;
    const rect = from.getBoundingClientRect();
    const c = getComputedStyle(from);
    if (rect.width > 0) {
      to.style.width = rect.width + 'px';
      to.style.minWidth = rect.width + 'px';
      to.style.maxWidth = rect.width + 'px';
      to.style.flex = '0 0 ' + rect.width + 'px';
    }
    if (rect.height > 0) {
      to.style.height = rect.height + 'px';
      to.style.minHeight = rect.height + 'px';
    }
    to.style.display = 'grid';
    to.style.placeItems = 'center';
    to.style.boxSizing = 'border-box';
    to.style.fontSize = c.fontSize;
    to.style.lineHeight = '1';
    to.style.padding = c.padding;
    to.style.margin = c.margin;
  };

  const normalizeCourseRows = () => {
    if (!location.hash.startsWith('#/dersler')) return;

    const rows = [...document.querySelectorAll('.course-list .course-row')];
    if (rows.length >= 4) {
      const ref = rows[0];
      const refIcon = ref.querySelector('.course-row-art');
      const refTitle = ref.querySelector('h3');
      const refDesc = ref.querySelector('p');

      rows.slice(-3).forEach(row => {
        copyIconBox(refIcon, row.querySelector('.course-row-art'));
        copyTextMetrics(refTitle, row.querySelector('h3'));
        copyTextMetrics(refDesc, row.querySelector('p'));

        const link = row.querySelector(':scope > a');
        const refLink = ref.querySelector(':scope > a');
        if (link && refLink) {
          const c = getComputedStyle(refLink);
          link.style.alignItems = c.alignItems;
          link.style.gap = c.gap;
        }
      });
    }

    const extras = [...document.querySelectorAll('.screen-content .reading-entry')];
    if (extras.length >= 2) {
      const ref = extras[0];
      const refIcon = ref.querySelector(':scope > span');
      const refTitle = ref.querySelector('strong');
      const refDesc = ref.querySelector('small');

      extras.forEach(card => {
        copyIconBox(refIcon, card.querySelector(':scope > span'));
        copyTextMetrics(refTitle, card.querySelector('strong'));
        copyTextMetrics(refDesc, card.querySelector('small'));
      });
    }
  };

  const run = () => requestAnimationFrame(normalizeCourseRows);

  const screen = document.getElementById('screen');
  if (screen) {
    new MutationObserver(run).observe(screen, { childList: true, subtree: true });
  }

  window.addEventListener('hashchange', run);
  window.addEventListener('resize', run);
  document.addEventListener('DOMContentLoaded', run);
  setTimeout(run, 0);
})();
