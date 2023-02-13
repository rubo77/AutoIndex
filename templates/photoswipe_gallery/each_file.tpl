<!-- http://photoswipe.com/documentation/getting-started.html -->

<figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
  <a itemprop="contentUrl" data-size="{file:width}x{file:height}" href="{file:link}">
   {file:thumbnail}
  </a>
  {if:description_file}
    {file:if:is_dir}<a class="autoindex_a" href="{file:link}" onclick="window.location='{file:link}'">{end if}
    <figcaption itemprop="caption description">
        {file:filename}
    </figcaption>
    {file:if:is_dir}</a>{end if}
  {end if:description_file}
</figure>
