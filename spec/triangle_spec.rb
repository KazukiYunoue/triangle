require File.expand_path(File.dirname(__FILE__) + '/../triangle')

describe Triangle do
  let(:triangle) { Triangle.new(side0, side1, side2) }
  describe "#sides" do
    subject { triangle.sides }
    context "when triangle is argumented 1, 1 and 1" do
      let(:side0) { 1 }; let(:side1) { 1 }; let(:side2) { 1 }
      it { is_expected.to eq [1,1,1]}
    end
  end

  describe "#kind" do
    subject { triangle.kind }
    context "when triangle has all same sides" do
      let(:side0) { 1 }; let(:side1) { 1 }; let(:side2) { 1 }
      it { is_expected.to eq "正三角形" }
    end
    context "when triangle has 2 same sides" do
      let(:side0) { 2 }; let(:side1) { 2 }; let(:side2) { 1 }
      it { is_expected.to eq "二等辺三角形" }
    end
    context "when triangle has different sides" do
      let(:side0) { 2 }; let(:side1) { 3 }; let(:side2) { 4 }
      it { is_expected.to eq "不等辺三角形" }
    end
    context "when biggest side is same size as other sides" do
      let(:side0) { 1 }; let(:side1) { 2 }; let(:side2) { 3 }
      it { is_expected.to eq nil }
    end
    context "when biggest side is larger than other sides" do
      let(:side0) { 1 }; let(:side1) { 2 }; let(:side2) { 4 }
      it { is_expected.to eq nil }
    end
    context "when at least one side is negative" do
      let(:side0) { -2 }; let(:side1) { 3 }; let(:side2) { 4 }
      it { is_expected.to eq nil }
    end
    context "when at least one side is zero" do
      let(:side0) { 0 }; let(:side1) { 3 }; let(:side2) { 4 }
      it { is_expected.to eq nil }
    end
  end
  
  describe "#speechified_kind" do
    subject { triangle.speechified_kind }
    context "when kind is e.g. \"不等辺三角形\"" do
      let(:side0) { 2 }; let(:side1) { 3 }; let(:side2) { 4 }
      it { is_expected.to eq "#{triangle.kind}ですね！" }
    end
    context "when kind is nil" do
      let(:side0) { 1 }; let(:side1) { 2 }; let(:side2) { 4 }
      it { is_expected.to eq "三角形じゃないです＞＜" }
    end
  end
end
