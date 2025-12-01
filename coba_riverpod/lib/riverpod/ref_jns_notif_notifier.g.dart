// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ref_jns_notif_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RefJnsNotifNotifier)
const refJnsNotifProvider = RefJnsNotifNotifierProvider._();

final class RefJnsNotifNotifierProvider
    extends $AsyncNotifierProvider<RefJnsNotifNotifier, List<RefJnsNotif>> {
  const RefJnsNotifNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'refJnsNotifProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$refJnsNotifNotifierHash();

  @$internal
  @override
  RefJnsNotifNotifier create() => RefJnsNotifNotifier();
}

String _$refJnsNotifNotifierHash() =>
    r'14ea267007a80d2bceaf7f2203d5129500d4b573';

abstract class _$RefJnsNotifNotifier extends $AsyncNotifier<List<RefJnsNotif>> {
  FutureOr<List<RefJnsNotif>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<RefJnsNotif>>, List<RefJnsNotif>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<RefJnsNotif>>, List<RefJnsNotif>>,
              AsyncValue<List<RefJnsNotif>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
