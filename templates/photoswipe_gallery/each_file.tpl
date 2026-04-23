<!-- http://photoswipe.com/documentation/getting-started.html -->

<figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
  {file:if:is_dir}
  <a class="autoindex_a" href="{file:link}" style="display: flex; justify-content: center; align-items: center; width: 100%; height: 100%; padding: 10px; box-sizing: border-box;">
        {file:filename}
  </a>
  {end if}
  {file:if:is_file}
  <a itemprop="contentUrl" data-size="{file:width}x{file:height}" href="{file:link}">
   {file:thumbnail}
  </a>
  {if:description_file}
    <figcaption itemprop="caption description">
        {file:filename}
    </figcaption>
  {end if:description_file}
  {end if}
</figure>
