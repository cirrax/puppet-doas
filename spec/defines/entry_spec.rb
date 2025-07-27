# frozen_string_literal: true

require 'spec_helper'

describe 'doas::entry' do
  let(:title) { 'namevar' }
  let(:params) do
    {
      target: '/etc/doas.conf',
      identity: 'someone',
      as_target: 'root',
      command: '/bin/false',
    }
  end

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }

      it {
        is_expected.to contain_concat__fragment('doas entry: namevar')
          .with_target('/etc/doas.conf')
          .with_order('namevar')
      }
    end
  end
end
