<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/modules.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>

		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

			<table class="">
				<tr>
					<th><?php echo $entry_search; ?></th>
					<td class="textleft">
						<input type="text" name="article" value="" />
						<?php echo $text_article_hint; ?>
					</td>
				</tr>
				<tr>
					<th><?php echo $entry_article; ?></th>
					<td class="none">
						<div class="scrollbox" id="featured-article">
							<?php $class = 'odd'; ?>
							<?php foreach ($articles as $article) { ?>
								<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
								<div id="featured-article<?php echo $article['article_id']; ?>" class="<?php echo $class; ?>">
									<?php echo $article['name']; ?> <img src="<?php echo ICON; ?>16/delete.png" />
									<input type="hidden" value="<?php echo $article['article_id']; ?>" />
								</div>
							<?php } ?>
						</div>
						<input type="hidden" name="featured_article" value="<?php echo $featured_article; ?>" />
					</td>
				</tr>
			</table>

			<table id="module" class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_layout; ?></th>
						<th scope="col" class="center"><?php echo $column_position; ?></th>
						<th scope="col" class="center"><?php echo $column_action; ?></th>
						<th scope="col" class="center"><?php echo $column_sort_order; ?></th>
						<th scope="col" class="center"><?php echo $column_image; ?></th>
						<th scope="col" class="center"></th>
					</tr>
				</thead>
				<?php $module_row = 0; ?>
				<?php foreach ($modules as $module) { ?>
				<tbody id="module-row<?php echo $module_row; ?>">
					<tr>
						<td>
							<select name="<?php echo $module_name; ?>[<?php echo $module_row; ?>][layout_id]">
								<?php foreach ($layouts as $layout) { ?>
									<?php if ($layout['layout_id'] == $module['layout_id']) { ?>
										<option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
									<?php } else { ?>
										<option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
									<?php } ?>
								<?php } ?>
							</select>
						</td>
						<td>
							<select name="<?php echo $module_name; ?>[<?php echo $module_row; ?>][position]">
								<?php if ($module['position'] == 'content_header') { ?>
									<option value="content_header" selected="selected"><?php echo $text_content_header; ?></option>
								<?php } else { ?>
									<option value="content_header"><?php echo $text_content_header; ?></option>
								<?php } ?>
								<?php if ($module['position'] == 'content_left') { ?>
									<option value="content_left" selected="selected"><?php echo $text_content_left; ?></option>
								<?php } else { ?>
									<option value="content_left"><?php echo $text_content_left; ?></option>
								<?php } ?>
								<?php if ($module['position'] == 'content_center') { ?>
									<option value="content_center" selected="selected"><?php echo $text_content_center; ?></option>
								<?php } else { ?>
									<option value="content_center"><?php echo $text_content_center; ?></option>
								<?php } ?>
								<?php if ($module['position'] == 'content_right') { ?>
									<option value="content_right" selected="selected"><?php echo $text_content_right; ?></option>
								<?php } else { ?>
									<option value="content_right"><?php echo $text_content_right; ?></option>
								<?php } ?>
								<?php if ($module['position'] == 'content_footer') { ?>
									<option value="content_footer" selected="selected"><?php echo $text_content_footer; ?></option>
								<?php } else { ?>
									<option value="content_footer"><?php echo $text_content_footer; ?></option>
								<?php } ?>
							</select>
						</td>
						<td>
							<select name="<?php echo $module_name; ?>[<?php echo $module_row; ?>][status]">
								<?php if ($module['status']) { ?>
									<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
									<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
									<option value="1"><?php echo $text_enabled; ?></option>
									<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select>
						</td>
						<td>
							<input type="text" name="<?php echo $module_name; ?>[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" />
						</td>
						<td>
							<?php if (isset($error_image[$module_row])) { ?>
								<input type="text" name="<?php echo $module_name; ?>[<?php echo $module_row; ?>][image_width]" value="<?php echo $module['image_width']; ?>" placeholder="<?php echo $error_width; ?>" class="input_error" />
								<input type="text" name="<?php echo $module_name; ?>[<?php echo $module_row; ?>][image_height]" value="<?php echo $module['image_height']; ?>" placeholder="<?php echo $error_height; ?>" class="input_error" />
							<?php } else { ?>
								<input type="text" name="<?php echo $module_name; ?>[<?php echo $module_row; ?>][image_width]" value="<?php echo $module['image_width']; ?>" size="3" />
								<input type="text" name="<?php echo $module_name; ?>[<?php echo $module_row; ?>][image_height]" value="<?php echo $module['image_height']; ?>" size="3" />
							<?php } ?>
							<?php echo $text_image_hint; ?>
						</td>
						<td class="center">
							<a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button button_red"><?php echo $button_subtract; ?></a>
						</td>
					</tr>
				</tbody>
				<?php $module_row++; ?>
				<?php } ?>
				<tfoot>
					<tr>
						<td colspan="5"></td>
						<td class="center"><a onclick="addModule();" class="button button_green"><?php echo $button_add; ?></a></td>
					</tr>
				</tfoot>
			</table>

<script type="text/javascript"><!--
$('input[name=\'article\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=article/article/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.article_id
					}
				}));
			}
		});
	},
	select: function(event, ui) {
		$('#featured-article' + ui.item.value).remove();
		$('#featured-article').append('<div id="featured-article' + ui.item.value + '">' + ui.item.label + '<img src="<?php echo ICON; ?>16/delete.png" /><input type="hidden" value="' + ui.item.value + '" /></div>');
		$('#featured-article div:odd').attr('class', 'odd');
		$('#featured-article div:even').attr('class', 'even');
		data = $.map($('#featured-article input'), function(element){
			return $(element).attr('value');
		});
		$('input[name=\'featured_article\']').attr('value', data.join());
		return false;
	}
});

$('#featured-article div img').live('click', function() {
	$(this).parent().remove();
	$('#featured-article div:odd').attr('class', 'odd');
	$('#featured-article div:even').attr('class', 'even');
	data = $.map($('#featured-article input'), function(element){
		return $(element).attr('value');
	});
	$('input[name=\'featured_article\']').attr('value', data.join());
});
//--></script>

<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;
var module_name = <?php echo $module_name; ?>;
function addModule() {
	html = '<tbody id="module-row' + module_row + '">';
	html += '<tr>';
	html += '<td><select name="<?php echo $module_name ?>[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
	<?php } ?>
	html += '</select></td>';
	html += '<td><select name="<?php echo $module_name ?>[' + module_row + '][position]">';
		html += '<option value="content_header"><?php echo $text_content_header; ?></option>';
		html += '<option value="content_left"><?php echo $text_content_left; ?></option>';
		html += '<option value="content_center"><?php echo $text_content_center; ?></option>';
		html += '<option value="content_right"><?php echo $text_content_right; ?></option>';
		html += '<option value="content_footer"><?php echo $text_content_footer; ?></option>';
	html += '</select></td>';
	html += '<td><select name="<?php echo $module_name ?>[' + module_row + '][status]">';
		html += '<option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
		html += '<option value="0"><?php echo $text_disabled; ?></option>';
	html += '</select></td>';
	html += '<td><input type="text" name="<?php echo $module_name ?>[' + module_row + '][sort_order]" value="" size="3" /></td>';
	html += '<td><input type="text" name="<?php echo $module_name ?>[' + module_row + '][image_width]" value="80" size="3" /> <input type="text" name="<?php echo $module_name ?>[' + module_row + '][image_height]" value="80" size="3" /><?php echo $text_image_hint; ?></td>';
	html += '<td class="center"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button button_red"><strong>-</strong></a></td>';
	html += '</tr>';
	html += '</tbody>';
	$('#module tfoot').before(html);
	module_row++;
}
//--></script>


			<div class="button_container container_grey">
				<a onclick="location = '<?php echo $cancel; ?>';" class="button button_red left"><?php echo $button_cancel; ?></a>
				<a onclick="$('#form').submit();" class="button button_green right"><?php echo $button_save; ?></a>
			</div>

		</form>

	</div>
</section>

	</div>
</div>

<?php echo $footer; ?>