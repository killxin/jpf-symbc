package edu.nju.seg.symbc.collections;

import java.util.Collections;
import java.util.Map;
import java.util.Map.Entry;

import gov.nasa.jpf.symbc.numeric.PathCondition;

public class CollectionPathCondition {
	static boolean flagSolved = false;

	public String smtlib = "";
	public Map<String, String> solution = Collections.<String, String>emptyMap();
	public CollectionConstraint header;
	int count = 0;

	private PathCondition npc = null;

	public CollectionPathCondition(PathCondition npc) {
		this.setNpc(npc);
		header = null;
	}

	public CollectionPathCondition make_copy(PathCondition npc) {
		CollectionPathCondition pc_new = new CollectionPathCondition(npc);
		pc_new.header = this.header;
		pc_new.count = this.count;
		return pc_new;
	}

	public void _addOpt(CollectionConstraint cc) {
		flagSolved = false;
		if (!hasConstraint(cc)) {
			cc.and = header;
			header = cc;
			count++;
		}
	}

	public int count() {
		return count;
	}

	public boolean hasConstraint(CollectionConstraint c) {
		CollectionConstraint t = header;

		while (t != null) {
			if (c.equals(t)) {
				return true;
			}

			t = t.and;
		}
		return false;
	}

	public String toString() {
		return "CPC # = " + count + ((header == null) ? "" : "\n" + header.toString()) + "\n" + "NPC " + npc.toString();
	}

	public PathCondition getNpc() {
		return npc;
	}

	public void setNpc(PathCondition npc) {
		this.npc = npc;
	}

	public Map<String, String> getSolution() {
		return this.solution;
	}

	public String printableStringSolution() {
		StringBuilder b = new StringBuilder();
		for (Entry<String, String> sol : solution.entrySet()) {
			b.append(sol.getKey()).append(" : \"").append(sol.getValue()).append("\"");
		}
		return b.toString();
	}
}
