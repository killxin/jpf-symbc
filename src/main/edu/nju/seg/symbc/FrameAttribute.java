package edu.nju.seg.symbc;

import java.util.Map;

import gov.nasa.jpf.symbc.numeric.Expression;
import gov.nasa.jpf.vm.ElementInfo;

public class FrameAttribute {
	public Expression rEturn;
	public Map<ElementInfo, Object> symbcInfo;
	public FrameAttribute(Expression rEturn, Map<ElementInfo, Object> symbcInfo) {
		this.rEturn = rEturn;
		this.symbcInfo = symbcInfo;
	}
}
