<?php
class ControllerShippingUsps extends Controller {
	private $error = array();

	public function index() {
		$this->data = array_merge($this->data, $this->load->language('shipping/usps'));
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('usps', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('extension/shipping', 'token=' . $this->session->data['token'], 'SSL'));
		}

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->error['user_id'])) {
			$this->data['error_user_id'] = $this->error['user_id'];
		} else {
			$this->data['error_user_id'] = '';
		}

		if (isset($this->error['postcode'])) {
			$this->data['error_postcode'] = $this->error['postcode'];
		} else {
			$this->data['error_postcode'] = '';
		}

		if (isset($this->error['width'])) {
			$this->data['error_width'] = $this->error['width'];
		} else {
			$this->data['error_width'] = '';
		}

		if (isset($this->error['length'])) {
			$this->data['error_length'] = $this->error['length'];
		} else {
			$this->data['error_length'] = '';
		}

		if (isset($this->error['height'])) {
			$this->data['error_height'] = $this->error['height'];
		} else {
			$this->data['error_height'] = '';
		}

		if (isset($this->error['girth'])) {
			$this->data['error_girth'] = $this->error['girth'];
		} else {
			$this->data['error_girth'] = '';
		}

/*
		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_shipping'),
			'href'      => $this->url->link('extension/shipping', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => $this->language->get('text_separator')
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('shipping/usps', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => $this->language->get('text_separator')
		);
*/
$this->document->addBreadcrumbs(
	$this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
	$this->language->get('text_home'),
	false
);
$this->document->addBreadcrumbs(
	$this->url->link('extension/shipping', 'token=' . $this->session->data['token'], 'SSL'),
	$this->language->get('text_shipping'),
	$this->language->get('text_separator')
);
$this->document->addBreadcrumbs(
	$this->url->link('shipping/usps', 'token=' . $this->session->data['token'], 'SSL'),
	$this->language->get('heading_title'),
	$this->language->get('text_separator')
);

		$this->data['action'] = $this->url->link('shipping/usps', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['cancel'] = $this->url->link('extension/shipping', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->post['usps_user_id'])) {
			$this->data['usps_user_id'] = $this->request->post['usps_user_id'];
		} else {
			$this->data['usps_user_id'] = $this->config->get('usps_user_id');
		}

		if (isset($this->request->post['usps_postcode'])) {
			$this->data['usps_postcode'] = $this->request->post['usps_postcode'];
		} else {
			$this->data['usps_postcode'] = $this->config->get('usps_postcode');
		}

		if (isset($this->request->post['usps_domestic_00'])) {
			$this->data['usps_domestic_00'] = $this->request->post['usps_domestic_00'];
		} else {
			$this->data['usps_domestic_00'] = $this->config->get('usps_domestic_00');
		}

		if (isset($this->request->post['usps_domestic_01'])) {
			$this->data['usps_domestic_01'] = $this->request->post['usps_domestic_01'];
		} else {
			$this->data['usps_domestic_01'] = $this->config->get('usps_domestic_01');
		}

		if (isset($this->request->post['usps_domestic_02'])) {
			$this->data['usps_domestic_02'] = $this->request->post['usps_domestic_02'];
		} else {
			$this->data['usps_domestic_02'] = $this->config->get('usps_domestic_02');
		}

		if (isset($this->request->post['usps_domestic_03'])) {
			$this->data['usps_domestic_03'] = $this->request->post['usps_domestic_03'];
		} else {
			$this->data['usps_domestic_03'] = $this->config->get('usps_domestic_03');
		}

		if (isset($this->request->post['usps_domestic_1'])) {
			$this->data['usps_domestic_1'] = $this->request->post['usps_domestic_1'];
		} else {
			$this->data['usps_domestic_1'] = $this->config->get('usps_domestic_1');
		}

		if (isset($this->request->post['usps_domestic_2'])) {
			$this->data['usps_domestic_2'] = $this->request->post['usps_domestic_2'];
		} else {
			$this->data['usps_domestic_2'] = $this->config->get('usps_domestic_2');
		}

		if (isset($this->request->post['usps_domestic_3'])) {
			$this->data['usps_domestic_3'] = $this->request->post['usps_domestic_3'];
		} else {
			$this->data['usps_domestic_3'] = $this->config->get('usps_domestic_3');
		}

		if (isset($this->request->post['usps_domestic_4'])) {
			$this->data['usps_domestic_4'] = $this->request->post['usps_domestic_4'];
		} else {
			$this->data['usps_domestic_4'] = $this->config->get('usps_domestic_4');
		}

		if (isset($this->request->post['usps_domestic_5'])) {
			$this->data['usps_domestic_5'] = $this->request->post['usps_domestic_5'];
		} else {
			$this->data['usps_domestic_5'] = $this->config->get('usps_domestic_5');
		}

		if (isset($this->request->post['usps_domestic_6'])) {
			$this->data['usps_domestic_6'] = $this->request->post['usps_domestic_6'];
		} else {
			$this->data['usps_domestic_6'] = $this->config->get('usps_domestic_6');
		}

		if (isset($this->request->post['usps_domestic_7'])) {
			$this->data['usps_domestic_7'] = $this->request->post['usps_domestic_7'];
		} else {
			$this->data['usps_domestic_7'] = $this->config->get('usps_domestic_7');
		}

		if (isset($this->request->post['usps_domestic_12'])) {
			$this->data['usps_domestic_12'] = $this->request->post['usps_domestic_12'];
		} else {
			$this->data['usps_domestic_12'] = $this->config->get('usps_domestic_12');
		}

		if (isset($this->request->post['usps_domestic_13'])) {
			$this->data['usps_domestic_13'] = $this->request->post['usps_domestic_13'];
		} else {
			$this->data['usps_domestic_13'] = $this->config->get('usps_domestic_13');
		}

		if (isset($this->request->post['usps_domestic_16'])) {
			$this->data['usps_domestic_16'] = $this->request->post['usps_domestic_16'];
		} else {
			$this->data['usps_domestic_16'] = $this->config->get('usps_domestic_16');
		}

		if (isset($this->request->post['usps_domestic_17'])) {
			$this->data['usps_domestic_17'] = $this->request->post['usps_domestic_17'];
		} else {
			$this->data['usps_domestic_17'] = $this->config->get('usps_domestic_17');
		}

		if (isset($this->request->post['usps_domestic_18'])) {
			$this->data['usps_domestic_18'] = $this->request->post['usps_domestic_18'];
		} else {
			$this->data['usps_domestic_18'] = $this->config->get('usps_domestic_18');
		}

		if (isset($this->request->post['usps_domestic_19'])) {
			$this->data['usps_domestic_19'] = $this->request->post['usps_domestic_19'];
		} else {
			$this->data['usps_domestic_19'] = $this->config->get('usps_domestic_19');
		}

		if (isset($this->request->post['usps_domestic_22'])) {
			$this->data['usps_domestic_22'] = $this->request->post['usps_domestic_22'];
		} else {
			$this->data['usps_domestic_22'] = $this->config->get('usps_domestic_22');
		}

		if (isset($this->request->post['usps_domestic_23'])) {
			$this->data['usps_domestic_23'] = $this->request->post['usps_domestic_23'];
		} else {
			$this->data['usps_domestic_23'] = $this->config->get('usps_domestic_23');
		}

		if (isset($this->request->post['usps_domestic_25'])) {
			$this->data['usps_domestic_25'] = $this->request->post['usps_domestic_25'];
		} else {
			$this->data['usps_domestic_25'] = $this->config->get('usps_domestic_25');
		}

		if (isset($this->request->post['usps_domestic_27'])) {
			$this->data['usps_domestic_27'] = $this->request->post['usps_domestic_27'];
		} else {
			$this->data['usps_domestic_27'] = $this->config->get('usps_domestic_27');
		}

		if (isset($this->request->post['usps_domestic_28'])) {
			$this->data['usps_domestic_28'] = $this->request->post['usps_domestic_28'];
		} else {
			$this->data['usps_domestic_28'] = $this->config->get('usps_domestic_28');
		}

		if (isset($this->request->post['usps_international_1'])) {
			$this->data['usps_international_1'] = $this->request->post['usps_international_1'];
		} else {
			$this->data['usps_international_1'] = $this->config->get('usps_international_1');
		}

		if (isset($this->request->post['usps_international_2'])) {
			$this->data['usps_international_2'] = $this->request->post['usps_international_2'];
		} else {
			$this->data['usps_international_2'] = $this->config->get('usps_international_2');
		}

		if (isset($this->request->post['usps_international_4'])) {
			$this->data['usps_international_4'] = $this->request->post['usps_international_4'];
		} else {
			$this->data['usps_international_4'] = $this->config->get('usps_international_4');
		}

		if (isset($this->request->post['usps_international_5'])) {
			$this->data['usps_international_5'] = $this->request->post['usps_international_5'];
		} else {
			$this->data['usps_international_5'] = $this->config->get('usps_international_5');
		}

		if (isset($this->request->post['usps_international_6'])) {
			$this->data['usps_international_6'] = $this->request->post['usps_international_6'];
		} else {
			$this->data['usps_international_6'] = $this->config->get('usps_international_6');
		}

		if (isset($this->request->post['usps_international_7'])) {
			$this->data['usps_international_7'] = $this->request->post['usps_international_7'];
		} else {
			$this->data['usps_international_7'] = $this->config->get('usps_international_7');
		}

		if (isset($this->request->post['usps_international_8'])) {
			$this->data['usps_international_8'] = $this->request->post['usps_international_8'];
		} else {
			$this->data['usps_international_8'] = $this->config->get('usps_international_8');
		}

		if (isset($this->request->post['usps_international_9'])) {
			$this->data['usps_international_9'] = $this->request->post['usps_international_9'];
		} else {
			$this->data['usps_international_9'] = $this->config->get('usps_international_9');
		}

		if (isset($this->request->post['usps_international_10'])) {
			$this->data['usps_international_10'] = $this->request->post['usps_international_10'];
		} else {
			$this->data['usps_international_10'] = $this->config->get('usps_international_10');
		}

		if (isset($this->request->post['usps_international_11'])) {
			$this->data['usps_international_11'] = $this->request->post['usps_international_11'];
		} else {
			$this->data['usps_international_11'] = $this->config->get('usps_international_11');
		}

		if (isset($this->request->post['usps_international_12'])) {
			$this->data['usps_international_12'] = $this->request->post['usps_international_12'];
		} else {
			$this->data['usps_international_12'] = $this->config->get('usps_international_12');
		}

		if (isset($this->request->post['usps_international_13'])) {
			$this->data['usps_international_13'] = $this->request->post['usps_international_13'];
		} else {
			$this->data['usps_international_13'] = $this->config->get('usps_international_13');
		}

		if (isset($this->request->post['usps_international_14'])) {
			$this->data['usps_international_14'] = $this->request->post['usps_international_14'];
		} else {
			$this->data['usps_international_14'] = $this->config->get('usps_international_14');
		}

		if (isset($this->request->post['usps_international_15'])) {
			$this->data['usps_international_15'] = $this->request->post['usps_international_15'];
		} else {
			$this->data['usps_international_15'] = $this->config->get('usps_international_15');
		}

		if (isset($this->request->post['usps_international_16'])) {
			$this->data['usps_international_16'] = $this->request->post['usps_international_16'];
		} else {
			$this->data['usps_international_16'] = $this->config->get('usps_international_16');
		}

		if (isset($this->request->post['usps_international_21'])) {
			$this->data['usps_international_21'] = $this->request->post['usps_international_21'];
		} else {
			$this->data['usps_international_21'] = $this->config->get('usps_international_21');
		}

		if (isset($this->request->post['usps_size'])) {
			$this->data['usps_size'] = $this->request->post['usps_size'];
		} else {
			$this->data['usps_size'] = $this->config->get('usps_size');
		}

		$this->data['sizes'] = array();

		$this->data['sizes'][] = array(
			'text'  => $this->language->get('text_regular'),
			'value' => 'REGULAR'
		);

		$this->data['sizes'][] = array(
			'text'  => $this->language->get('text_large'),
			'value' => 'LARGE'
		);

		if (isset($this->request->post['usps_container'])) {
			$this->data['usps_container'] = $this->request->post['usps_container'];
		} else {
			$this->data['usps_container'] = $this->config->get('usps_container');
		}

		$this->data['containers'] = array();

		$this->data['containers'][] = array(
			'text'  => $this->language->get('text_rectangular'),
			'value' => 'RECTANGULAR'
		);

		$this->data['containers'][] = array(
			'text'  => $this->language->get('text_non_rectangular'),
			'value' => 'NONRECTANGULAR'
		);

		$this->data['containers'][] = array(
			'text'  => $this->language->get('text_variable'),
			'value' => 'VARIABLE'
		);

		if (isset($this->request->post['usps_machinable'])) {
			$this->data['usps_machinable'] = $this->request->post['usps_machinable'];
		} else {
			$this->data['usps_machinable'] = $this->config->get('usps_machinable');
		}

		if (isset($this->request->post['usps_length'])) {
			$this->data['usps_length'] = $this->request->post['usps_length'];
		} else {
			$this->data['usps_length'] = $this->config->get('usps_length');
		}

		if (isset($this->request->post['usps_width'])) {
			$this->data['usps_width'] = $this->request->post['usps_width'];
		} else {
			$this->data['usps_width'] = $this->config->get('usps_width');
		}

		if (isset($this->request->post['usps_height'])) {
			$this->data['usps_height'] = $this->request->post['usps_height'];
		} else {
			$this->data['usps_height'] = $this->config->get('usps_height');
		}

		if (isset($this->request->post['usps_length'])) {
			$this->data['usps_length'] = $this->request->post['usps_length'];
		} else {
			$this->data['usps_length'] = $this->config->get('usps_length');
		}

		if (isset($this->request->post['usps_girth'])) {
			$this->data['usps_girth'] = $this->request->post['usps_girth'];
		} else {
			$this->data['usps_girth'] = $this->config->get('usps_girth');
		}

		if (isset($this->request->post['usps_display_time'])) {
			$this->data['usps_display_time'] = $this->request->post['usps_display_time'];
		} else {
			$this->data['usps_display_time'] = $this->config->get('usps_display_time');
		}

		if (isset($this->request->post['usps_display_weight'])) {
			$this->data['usps_display_weight'] = $this->request->post['usps_display_weight'];
		} else {
			$this->data['usps_display_weight'] = $this->config->get('usps_display_weight');
		}

		if (isset($this->request->post['usps_weight_class_id'])) {
			$this->data['usps_weight_class_id'] = $this->request->post['usps_weight_class_id'];
		} else {
			$this->data['usps_weight_class_id'] = $this->config->get('usps_weight_class_id');
		}

		$this->load->model('localisation/weight_class');

		$this->data['weight_classes'] = $this->model_localisation_weight_class->getWeightClasses();

		if (isset($this->request->post['usps_tax_class_id'])) {
			$this->data['usps_tax_class_id'] = $this->request->post['usps_tax_class_id'];
		} else {
			$this->data['usps_tax_class_id'] = $this->config->get('usps_tax_class_id');
		}

		if (isset($this->request->post['usps_geo_zone_id'])) {
			$this->data['usps_geo_zone_id'] = $this->request->post['usps_geo_zone_id'];
		} else {
			$this->data['usps_geo_zone_id'] = $this->config->get('usps_geo_zone_id');
		}

		$this->data['firstclass_types'] = array();

		$this->data['firstclass_types'][] = array(
			'text'  => $this->language->get('text_disabled'),
			'value' => ''
		);

		$this->data['firstclass_types'][] = array(
			'text'  => $this->language->get('text_letter'),
			'value' => 'LETTER'
		);

		$this->data['firstclass_types'][] = array(
			'text'  => $this->language->get('text_parcel'),
			'value' => 'PARCEL'
		);

		if (isset($this->request->post['usps_firstclass_type'])) {
			$this->data['usps_firstclass_type'] = $this->request->post['usps_firstclass_type'];
		} else {
			$this->data['usps_firstclass_type'] = $this->config->get('usps_firstclass_type');
		}

		if (isset($this->request->post['usps_debug'])) {
			$this->data['usps_debug'] = $this->request->post['usps_debug'];
		} else {
			$this->data['usps_debug'] = $this->config->get('usps_debug');
		}

		if (isset($this->request->post['usps_status'])) {
			$this->data['usps_status'] = $this->request->post['usps_status'];
		} else {
			$this->data['usps_status'] = $this->config->get('usps_status');
		}

		if (isset($this->request->post['usps_sort_order'])) {
			$this->data['usps_sort_order'] = $this->request->post['usps_sort_order'];
		} else {
			$this->data['usps_sort_order'] = $this->config->get('usps_sort_order');
		}

		$this->load->model('localisation/tax_class');

		$this->data['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();

		$this->load->model('localisation/geo_zone');

		$this->data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

		$this->document->addStyle('view/stylesheet/table.css');

		$this->template = 'shipping/usps.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);

		$this->response->setOutput($this->render());
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'shipping/usps')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->request->post['usps_user_id']) {
			$this->error['user_id'] = $this->language->get('error_user_id');
		}

		if (!$this->request->post['usps_postcode']) {
			$this->error['postcode'] = $this->language->get('error_postcode');
		}

		if (!$this->request->post['usps_width']) {
			$this->error['width'] = $this->language->get('error_width');
		}

		if (!$this->request->post['usps_height']) {
			$this->error['height'] = $this->language->get('error_height');
		}

		if (!$this->request->post['usps_length']) {
			$this->error['length'] = $this->language->get('error_length');
		}

		if (!$this->request->post['usps_girth']) {
			$this->error['girth'] = $this->language->get('error_girth');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
}
