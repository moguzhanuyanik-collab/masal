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

    const specialCards = [...document.querySelectorAll('.screen-content .reading-entry, .screen-content .island')]
      .filter(card => {
        const text = (card.textContent || '').replace(/\s+/g, ' ').trim();
        return text.includes('Okuma Bahçem') || text.includes('Keşif Haritam');
      });

    if (rows.length && specialCards.length) {
      const ref = rows[0];
      const refIcon = ref.querySelector('.course-row-art');
      const refTitle = ref.querySelector('h3');
      const refDesc = ref.querySelector('p');

      specialCards.forEach(card => {
        const icon = card.querySelector(':scope > span, .reading-art, .island-art');
        const title = card.querySelector('strong, h3, h2');
        const desc = card.querySelector('small, p');

        copyIconBox(refIcon, icon);
        copyTextMetrics(refTitle, title);
        copyTextMetrics(refDesc, desc);

        if (refIcon && icon) {
          const refSvg = refIcon.querySelector('svg');
          const targetSvg = icon.querySelector('svg');
          if (refSvg && targetSvg) {
            const rect = refSvg.getBoundingClientRect();
            if (rect.width > 0) targetSvg.style.width = rect.width + 'px';
            if (rect.height > 0) targetSvg.style.height = rect.height + 'px';
          }
        }
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
